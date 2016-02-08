//
//  SoundEngine.h
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef SoundEngine_h
#define SoundEngine_h

#import <AVFoundation/AVFoundation.h>

@interface SoundEngine : NSObject

@property (strong, nonatomic) AVAudioPlayer* player;

- (id) init;

- (void) play: (NSString*) fileName type: (NSString*) type;

- (void) toggle;

@end

#endif /* SoundEngine_h */
