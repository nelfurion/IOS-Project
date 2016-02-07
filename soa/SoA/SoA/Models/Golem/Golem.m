//
//  Golem.m
//  SoA
//
//  Created by John Doe on 2/4/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Golem.h"
#import <UIKit/UIKit.h>
#import "MCSpriteLayer.h"

static NSString *const GolemClassName = @"Golem";

@implementation Golem

- (instancetype) init {
    if (self = [super init]) {
        self.positionX = 0; //TODO: depends on level
        self.positionY = 0; //TODO: depends on level
        self.width = 50;
        self.height = 100;
        self.health = 20;
        self.attackPower = 5;
    }
    
    return self;
}

- (void) performActionWithFrames: (NSMutableArray*) frames {
    [self.spriteNode runAction:[SKAction repeatActionForever:[SKAction animateWithTextures:frames
                                                                              timePerFrame:0.1f
                                                                                    resize:NO
                                                                                   restore:YES]] withKey:@"golemAnimation"];
}

- (instancetype) initWithAnimationsData {
    self = [self init];
    self.idleFrames = [self createAnimationFrames: @"golemIdle"];
    self.walkFrames = [self createAnimationFrames: @"golemWalk"];
    self.attackFrames = [self createAnimationFrames: @"golemAttack"];
    
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

+ (instancetype) golemWithDefaultSettings {
    return [[Golem alloc] initWithAnimationsData];
}

@end