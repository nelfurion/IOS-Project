//
//  SoundEngine.h
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef SoundEngine_h
#define SoundEngine_h

#import <OpenAl/al.h>
#import <OpenAl/alc.h>
#include <AudioToolbox/AudioToolbox.h>

@interface SoundEngine : NSObject 

@property (nonatomic) ALCcontext* context;
@property (nonatomic) ALCdevice* device;
@property (nonatomic) NSMutableArray * bufferStorageArray;
@property (nonatomic) NSMutableDictionary* soundDictionary;

- (id) init;
- (void) initOpenAL;
- (void) playAudioFile;
- (void) bing;

@end

#endif /* SoundEngine_h */
