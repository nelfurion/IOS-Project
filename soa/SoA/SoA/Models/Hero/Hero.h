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
#import <SpriteKit/SpriteKit.h>

@interface Hero : NSObject

@property (nonatomic) NSInteger strength;
@property (nonatomic) NSInteger agility;
@property (nonatomic) NSInteger stamina;
@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger level;
@property (nonatomic) NSInteger velocity;
@property (nonatomic) bool isDirectionLeft;
@property (nonatomic) bool isCurrentlyMoving;
@property (nonatomic) bool isCurrentlyJumping;

@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger attackPower;

@property (strong, nonatomic) NSMutableArray* idleFrames;
@property (strong, nonatomic) NSMutableArray* walkFrames;
@property (strong, nonatomic) NSMutableArray* attackFrames;
@property (strong, nonatomic) SKSpriteNode* spriteNode;

- (instancetype) init;

- (instancetype) initWithAnimationsData;

- (void) lvlUp;

- (void) move;

- (void) performActionWithFrames: (NSMutableArray*) frames;

- (void) calculateVitals;

- (void) jump;

+ (instancetype) heroWithDefaultSettings;

@end

#endif /* Hero_h */
