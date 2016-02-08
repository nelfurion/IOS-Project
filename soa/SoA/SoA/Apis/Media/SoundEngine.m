//
//  SoundEngine.m
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundEngine.h"


@implementation SoundEngine

- (id) init {
    return self;
}

- (void) play: (NSString*) fileName type: (NSString*) type {
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *soundData = [[NSData alloc] initWithContentsOfFile:soundFilePath];
    NSError *error;
    self.player = [[AVAudioPlayer alloc]
                     initWithData:soundData error:&error];
    [self.player prepareToPlay];
    [self.player play];
}

- (void) toggle {
    if (self.player.isPlaying) {
        [self.player stop];
        [self.player setCurrentTime:0];
    }
    else {
        [self.player prepareToPlay];
        [self.player play];
    }
}

@end

