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
#import "../Models/Hero/Hero.h"

static Hero *hero;
static AVAudioPlayer *avAudioPlayer;
static NSMutableArray *entities;

@interface Engine : NSObject

+ (void) handleMove: (BOOL) isMovingLeft;

+ (void) handleJump;

+ (void) handleSwipe: (UISwipeGestureRecognizerDirection) direction;

+ (void) start: (UIView*) view;

+ (void) handleAttack;

@end

#endif /* Engine_h */
