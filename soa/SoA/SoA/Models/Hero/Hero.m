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
        self.isDirectionLeft = YES;
        self.isCurrentlyMoving = NO;
        self.isCurrentlyJumping = NO;
        self.velocity = -10;
    }
    
    return self;
}

- (void) move: (BOOL) isMovingLeft {
    if (!self.isCurrentlyMoving) {
        if (self.isDirectionLeft != isMovingLeft) {
            self.spriteNode.xScale = -self.spriteNode.xScale;
            self.isDirectionLeft = !self.isDirectionLeft;
            self.velocity = -self.velocity;
        }
        
        [self.spriteNode runAction:[SKAction repeatActionForever:
                                    [SKAction moveByX:self.velocity
                                                    y:0 duration:0.1]]];
        [self performActionWithFrames:self.walkFrames];
        self.isCurrentlyMoving = YES;
    } else {
        [self.spriteNode removeAllActions];
        self.isCurrentlyMoving = NO;
        [self performActionWithFrames:self.idleFrames];
    }
}

- (void) attack {
    if (!self.isCurrentlyAttacking) {
        self.isCurrentlyAttacking = YES;
        [self.spriteNode runAction:[SKAction animateWithTextures:self.attackFrames
                                                    timePerFrame:0.1f
                                                          resize:NO
                                                         restore:YES]
                        completion: ^{
                            self.isCurrentlyAttacking = NO;
                            [self performActionWithFrames:self.idleFrames];
                        }];
    }
    
}

- (void) dash: (UISwipeGestureRecognizerDirection) direction {
    long dashVelocity = labs(self.velocity) * 15;
    if (direction == UISwipeGestureRecognizerDirectionLeft) {
        self.spriteNode.position = CGPointMake(self.spriteNode.position.x - dashVelocity, self.spriteNode.position.y);
    } else if (direction == UISwipeGestureRecognizerDirectionRight) {
        self.spriteNode.position = CGPointMake(self.spriteNode.position.x + dashVelocity, self.spriteNode.position.y);
    }
}

- (void) jump {
    if (!self.isCurrentlyJumping) {
        self.isCurrentlyJumping = YES;
        NSLog(@"jumping");
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointZero];
        [path addQuadCurveToPoint: CGPointMake(
                                               self.spriteNode.position.x + self.velocity / 4,
                                               self.spriteNode.position.y + 5)
         
                     controlPoint:CGPointMake(
                                              self.spriteNode.position.x + self.velocity / 2,
                                              self.spriteNode.position.y + 10)];
        
        [path addQuadCurveToPoint:CGPointMake(
                                              self.spriteNode.position.x + self.velocity  * (3 / 4),
                                              self.spriteNode.position.y + 5)
         
                     controlPoint:CGPointMake(
                                              self.spriteNode.position.x + self.velocity,
                                              self.spriteNode.position.y)];
        CGPathRef pathref = path.CGPath;
        
        
        
        [self.spriteNode runAction:[SKAction followPath:pathref duration:0.2] completion:^{
            NSLog(@"jump ended");
            [self setIsCurrentlyJumping:NO];
            self.spriteNode.zRotation = 0;
            [self performActionWithFrames:self.idleFrames];
        }];
    }
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
    if (self) {
        self.idleFrames = [self createAnimationFrames: @"heroIdle"];
        self.walkFrames = [self createAnimationFrames: @"heroWalk"];
        self.attackFrames = [self createAnimationFrames: @"heroAttack"];
        
        //Create hero sprite
        SKTexture *temp = self.idleFrames[0];
        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:temp];
        
        [self.spriteNode setScale:0.3];
        SKPhysicsBody *body = [SKPhysicsBody bodyWithTexture:self.idleFrames[0] size:self.spriteNode.size];
        self.spriteNode.physicsBody = body;
        
        self.spriteNode.physicsBody.allowsRotation = NO;
    }
    
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