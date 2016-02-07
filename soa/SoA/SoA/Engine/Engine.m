//
//  Engine.m
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Engine.h"
#import "../Models/Hero/Hero.h"
#import "../Models/Golem/Golem.h"


@class LevelManager;

@implementation  Engine

+ (void) start: (UIView*) view {
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"do_not_run" ofType:@"mp3"];
    NSData *sampleData = [[NSData alloc] initWithContentsOfFile:soundFilePath];
    
    NSError *error;
    avAudioPlayer = [[AVAudioPlayer alloc]
                                            initWithData:sampleData error:&error];
    [avAudioPlayer prepareToPlay];
    [avAudioPlayer play];

    
    SKView * skView = (SKView *)view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene *scene = [SKScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    CGSize groundSize = CGSizeMake(scene.frame.size.width + 1, 100);
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor brownColor] size:groundSize];
    ground.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMinY(scene.frame) + 100);
    if(ground.texture == NULL) {
        NSLog(@"ground texture is null");
    }
    SKPhysicsBody *groundBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody = groundBody;
    groundBody.dynamic = NO;
    [scene addChild:ground];

    hero = [Hero heroWithDefaultSettings];
    hero.spriteNode.position = CGPointMake(CGRectGetMidX(scene.frame), CGRectGetMaxY(scene.frame) - hero.spriteNode.size.height / 2);
    [scene addChild:hero.spriteNode];
    
    //Start the bear walking
    //[self walkingBear];
    
    [hero performActionWithFrames:hero.idleFrames];
    
    Golem *golem = [Golem golemWithDefaultSettings];
    golem.spriteNode.position = CGPointMake(CGRectGetMidX(scene.frame) + 100, CGRectGetMaxY(scene.frame) - hero.spriteNode.size.height / 2);
    [scene addChild:golem.spriteNode];
    [golem performActionWithFrames:golem.attackFrames];
}

+ (void) handleMoveLeft {
    if (!hero.isDirectionLeft) {
        hero.spriteNode.xScale = hero.spriteNode.xScale * -1;
        hero.isDirectionLeft = YES;
        hero.velocity = -10;
    }
    
    if (!hero.isCurrentlyMoving) {
        [hero performActionWithFrames:hero.walkFrames];
        hero.isCurrentlyMoving = YES;
    }
    
    [hero move];
}

+ (void) handleJump {
    [hero jump];
}

+ (void) handleMoveRight {
    if (hero.isDirectionLeft) {
        hero.spriteNode.xScale = hero.spriteNode.xScale * -1;
        hero.isDirectionLeft = NO;
        hero.velocity = 10;
    }
    
    if (!hero.isCurrentlyMoving) {
        [hero performActionWithFrames:hero.walkFrames];
        hero.isCurrentlyMoving = YES;
    }
    
    [hero move];
}

@end