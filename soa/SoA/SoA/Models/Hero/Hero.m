//
//  Hero.m
//  SoA
//
//  Created by John Doe on 2/4/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import <UIKit/UIKit.h>
#import "MCSpriteLayer.h"

static NSInteger const heroInitialSecondaryStatValue = 10;
static NSInteger const HeroHealthPerLevel = 50;
static NSInteger const HeroAttackPowerPerLevel = 2;
static NSInteger const HeroInitialAttackPower = 10;
static NSString *const HeroClassName = @"Hero";

@implementation Hero

@synthesize framesCount;
@synthesize frames;

- (CALayer*) Animate {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Hero.png" ofType:nil];
    CGImageRef img = [UIImage imageWithContentsOfFile:path].CGImage;
    
    MCSpriteLayer *layer = [MCSpriteLayer layer];
    layer.contents = (__bridge id)img;
    
    CGSize size = CGSizeMake( 160, 198 ); // size in pixels of one frame
    CGSize normalizedSize = CGSizeMake(
                                       size.width/CGImageGetWidth(img),
                                       size.height/CGImageGetHeight(img));
    
    layer.bounds = CGRectMake(100, 100, 80, 140);
    layer.contentsRect = CGRectMake( 0, 0, normalizedSize.width, normalizedSize.height );
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sampleIndex"];
    
    animation.fromValue = [NSNumber numberWithInt:1]; // initial frame
    animation.toValue = [NSNumber numberWithInt:6]; // last frame + 1
    
    animation.duration = 1.0f; // from the first frame to the 6th one in 1 second
    animation.repeatCount = HUGE_VALF; // just keep repeating it
    animation.autoreverses = YES; // do 1, 2, 3, 4, 5, 4, 3, 2
    
    [layer addAnimation:animation forKey:nil]; // start
    return layer;
}

- (id) init {
    if (self = [super init]) {
        self.agility = heroInitialSecondaryStatValue;
        self.strength = heroInitialSecondaryStatValue;
        self.stamina = heroInitialSecondaryStatValue;
        self.positionX = 0;
        self.positionY = 0;
        self.width = 50; //TODO: depends on level
        self.height = 100;  //TODO: depends on level
        self.framesCount = 4;  //TODO: depends on hero
        self.level = 1;
        self.health = HeroHealthPerLevel;
        self.attackPower = HeroInitialAttackPower;
        self.frames = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) lvlUp {
    self.level += 1;
    self.agility += 1;
    self.strength += 1;
    self.stamina += 1;
    [self calculateVitals];
}

- (void) calculateVitals {
    self.health = HeroHealthPerLevel * self.level + self.stamina + self.agility / 2;
    self.attackPower = HeroHealthPerLevel * self.level + HeroInitialAttackPower + self.agility / 2;
}

- (void) attack {
    
}

+ (id) heroWithDefaultStats {
    return [[Hero alloc] init];
}

@end