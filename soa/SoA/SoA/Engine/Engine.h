//
//  Engine.h
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef Engine_h
#define Engine_h

#import <AVFoundation/AVFoundation.h>

#import <UIKit/UIKit.h>
#import "../Models/Hero/Hero.h";

static Hero *hero;
static AVAudioPlayer *avAudioPlayer;

@interface Engine : NSObject

+ (void) handleMoveLeft;

+ (void) handleJump;

+ (void) handleMoveRight;

+ (void) start: (UIView*) view;

@end

#endif /* Engine_h */
