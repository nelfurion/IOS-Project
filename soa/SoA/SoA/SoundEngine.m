//
//  SoundEngine.m
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundEngine.h"
#import <AVFoundation/AVFoundation.h>

@implementation SoundEngine

@synthesize bufferStorageArray;

- (id) init {
    return self = [super init];
}

// start up openAL
- (void) initOpenAL
{
    // Initialization
    self.device = alcOpenDevice(NULL); // select the "preferred device"
    if (self.device) {
        // use the device to make a context
        self.context=alcCreateContext(self.device, NULL);
        // set my context to the currently active one
        alcMakeContextCurrent(self.context);
    }
}

- (void) bing {
    NSError *error;
    NSURL *url = [NSURL URLWithString:@"duration.mp3"];
    AVAudioPlayer *backgroundMusicPlayer = [[AVAudioPlayer alloc]
                                  initWithContentsOfURL:url error:&error];
    [backgroundMusicPlayer prepareToPlay];
    [backgroundMusicPlayer play];
}

- (void) playAudioFile{
    // get the full path of the file
    NSString* fileName = [[NSBundle mainBundle] pathForResource:@"stereo16bit" ofType:@"wav"];
    //NSString* fileName = @"duration.caf";
    // first, open the file
    AudioFileID fileID = [self openAudioFile:fileName];
    
    
    
    UInt32 fileSize = [self audioFileSize:fileID];
    
    NSLog(@"%u", fileSize);
    
    // this is where the audio data will live for the moment
    unsigned char * outData = malloc(fileSize);
    
    NSLog(@"%s", outData);
    
    // this where we actually get the bytes from the file and put them
    // into the data buffer
    OSStatus result = noErr;
    result = AudioFileReadBytes(fileID, false, 0, &fileSize, outData);
    AudioFileClose(fileID); //close the file
    
    if (result != 0) NSLog(@"cannot load effect: %@",fileName);
    
    NSUInteger bufferID;
    // grab a buffer ID from openAL
    alGenBuffers(1, &bufferID);
    
    // jam the audio data into the new buffer
    alBufferData(bufferID,AL_FORMAT_STEREO16,outData,fileSize,44100);
    
    // save the buffer so I can release it later
    [self.bufferStorageArray addObject:[NSNumber numberWithUnsignedInteger:bufferID]];
    
    NSUInteger sourceID;
    
    // grab a source ID from openAL
    alGenSources(1, &sourceID);
    
    // attach the buffer to the source
    alSourcei(sourceID, AL_BUFFER, bufferID);
    // set some basic source prefs
    alSourcef(sourceID, AL_PITCH, 1.0f);
    alSourcef(sourceID, AL_GAIN, 1.0f);
    //if (loops) alSourcei(sourceID, AL_LOOPING, AL_TRUE);
    
    // store this for future use
    [self.soundDictionary setObject:[NSNumber numberWithUnsignedInt:sourceID] forKey:@"neatoSound"];
    
    // clean up the buffer
    if (outData)
    {
        free(outData);
        outData = NULL;
    }
    
    
    NSNumber * numVal = [self.soundDictionary objectForKey:@"neatoSound"];
    if (numVal == nil) return;
    sourceID = [numVal unsignedIntValue];
    alSourcePlay(sourceID);

}

// open the audio file
// returns a big audio ID struct
-(AudioFileID)openAudioFile:(NSString*)filePath
{
    AudioFileID outAFID;
    // use the NSURl instead of a cfurlref cuz it is easier
    NSURL * afUrl = [NSURL fileURLWithPath:filePath];
    
    // do some platform specific stuff..
#if TARGET_OS_IPHONE
    OSStatus result = AudioFileOpenURL((__bridge CFURLRef)afUrl, kAudioFileReadPermission, 0, &outAFID);
#else
    OSStatus result = AudioFileOpenURL((CFURLRef)afUrl, fsRdPerm, 0, &outAFID);
#endif
    if (result != 0) NSLog(@"cannot openf file: %@",filePath);
    return outAFID;
}

// find the audio portion of the file
// return the size in bytes
-(UInt32)audioFileSize:(AudioFileID)fileDescriptor
{
    UInt64 outDataSize = 0;
    UInt32 thePropSize = sizeof(UInt64);
    OSStatus result = AudioFileGetProperty(fileDescriptor, kAudioFilePropertyAudioDataByteCount, &thePropSize, &outDataSize);
    if(result != 0) NSLog(@"cannot find file size");
    return (UInt32)outDataSize;
}

- (void)stopSound:(NSString*)soundKey
{
    NSNumber * numVal = [self.soundDictionary objectForKey:soundKey];
    if (numVal == nil) return;
    NSUInteger sourceID = [numVal unsignedIntValue];
    alSourceStop(sourceID);
}

-(void)cleanUpOpenAL:(id)sender
{
    // delete the sources
    for (NSNumber * sourceNumber in [self.soundDictionary allValues]) {
        NSUInteger sourceID = [sourceNumber unsignedIntegerValue];
        alDeleteSources(1, &sourceID);
    }
    [self.soundDictionary removeAllObjects];
    
    // delete the buffers
    for (NSNumber * bufferNumber in bufferStorageArray) {
        NSUInteger bufferID = [bufferNumber unsignedIntegerValue];
        alDeleteBuffers(1, &bufferID);
    }
    [bufferStorageArray removeAllObjects];
    
    // destroy the context
    alcDestroyContext(self.context);
    // close the device
    alcCloseDevice(self.device);
}


@end

