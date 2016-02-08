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
#import "../Entity.h"

@interface Golem : Entity

@property (nonatomic) BOOL isDirectionLeft;
@property (nonatomic) BOOL isCurrentlyAttacking;
@property (nonatomic) BOOL isCurrentlyIdle;

+ (instancetype) golemWithDefaultSettings;

- (void) watchOutForTarget: (Entity*) entity;

- (void) performActionWithFrames: (NSMutableArray*) frames;
@end

#endif /* Golem_h */
