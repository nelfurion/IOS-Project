//
//  Hero.h
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef Hero_h
#define Hero_h

#import "../Contracts/Animatable.h"
#import "../Entity.h"
#import <SpriteKit/SpriteKit.h>

@interface Hero : Entity

@property (nonatomic) NSInteger strength;
@property (nonatomic) NSInteger agility;
@property (nonatomic) NSInteger stamina;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger velocity;
@property (nonatomic) bool isDirectionLeft;
@property (nonatomic) bool isCurrentlyMoving;
@property (nonatomic) bool isCurrentlyJumping;
@property (nonatomic) bool isCurrentlyAttacking;

- (void) lvlUp;

- (void) move: (BOOL) isMovingLeft;

- (void) calculateVitals;

- (void) jump;

- (void) attack;

- (void) dash: (UISwipeGestureRecognizerDirection) direction;

+ (instancetype) heroWithDefaultSettings;

@end

#endif /* Hero_h */
