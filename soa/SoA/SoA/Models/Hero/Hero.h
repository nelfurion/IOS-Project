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

@interface Hero : NSObject<Animatable>

@property (nonatomic) NSInteger strength;
@property (nonatomic) NSInteger agility;
@property (nonatomic) NSInteger stamina;
@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@property (nonatomic) NSInteger level;

@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger attackPower;

- (id) init;

- (void) lvlUp;

- (void) attack;

- (void) calculateVitals;

+ (id) heroWithDefaultStats;

@end

#endif /* Hero_h */
