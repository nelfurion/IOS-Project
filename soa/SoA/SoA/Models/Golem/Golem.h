//
//  Golem.h
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef Golem_h
#define Golem_h

#import "../Contracts/Animatable.h"
#import <SpriteKit/SpriteKit.h>

@interface Golem : NSObject

@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;

@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger attackPower;

@property (strong, nonatomic) NSMutableArray* idleFrames;
@property (strong, nonatomic) NSMutableArray* walkFrames;
@property (strong, nonatomic) NSMutableArray* attackFrames;
@property (strong, nonatomic) SKSpriteNode* spriteNode;

- (instancetype) init;

- (instancetype) initWithAnimationsData;

- (void) performActionWithFrames: (NSMutableArray*) frames;

+ (instancetype) golemWithDefaultSettings;

@end

#endif /* Golem_h */
