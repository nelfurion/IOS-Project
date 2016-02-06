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

- (instancetype) init {
    if (self = [super init]) {
        self.agility = heroInitialSecondaryStatValue;
        self.strength = heroInitialSecondaryStatValue;
        self.stamina = heroInitialSecondaryStatValue;
        self.positionX = 0; //TODO: depends on level
        self.positionY = 0; //TODO: depends on level
        self.width = 50;
        self.height = 100;
        self.level = 1;
        self.health = HeroHealthPerLevel;
        self.attackPower = HeroInitialAttackPower;
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
    self.attackPower = HeroAttackPowerPerLevel * self.level + HeroInitialAttackPower + self.agility / 2;
}

- (void) performActionWithFrames: (NSMutableArray*) frames {
    [self.spriteNode runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:frames
                                                                               timePerFrame:0.1f
                                                                                     resize:NO
                                                                                    restore:YES]] withKey:@"heroAnimation"];
}

- (instancetype) initWithAnimationsData {
    self = [self init];
    self.idleFrames = [self createAnimationFrames: @"heroIdle"];
    self.walkFrames = [self createAnimationFrames: @"heroWalk"];
    self.attackFrames = [self createAnimationFrames: @"heroAttack"];
    
    //Create hero sprite
    SKTexture *temp = self.idleFrames[0];
    self.spriteNode = [SKSpriteNode spriteNodeWithTexture:temp];
    
    [self.spriteNode setScale:0.3];
    SKPhysicsBody *body = [SKPhysicsBody bodyWithTexture:self.idleFrames[0] size:self.spriteNode.size];
    self.spriteNode.physicsBody = body;
    
    //[self stayIdle];
    
    return self;
}

- (NSMutableArray*) createAnimationFrames: (NSString*) atlasName {
    NSMutableArray* frames = [NSMutableArray array];
    
    //Load the TextureAtlas for the bear
    SKTextureAtlas* atlas = [SKTextureAtlas atlasNamed:atlasName];
    
    
    //Load the animation frames from the TextureAtlas
    int numImages = atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"%@_%d", atlasName, i];
        SKTexture *temp = [atlas textureNamed:textureName];
        [frames addObject:temp];
    }
    
    return frames;
}

+ (instancetype) heroWithDefaultSettings {
    return [[Hero alloc] initWithAnimationsData];
}

@end