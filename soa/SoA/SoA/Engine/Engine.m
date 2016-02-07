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
    entities = [NSMutableArray array];
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
    
    [hero performActionWithFrames:hero.idleFrames];
    
    
    //TODO:
    //The entities should first be loaded in the array, and then placed on the scene from the array.
    
    Golem *golem = [Golem golemWithDefaultSettings];
    golem.spriteNode.position = CGPointMake(CGRectGetMidX(scene.frame) + 100, CGRectGetMaxY(scene.frame) - hero.spriteNode.size.height / 2);
    [scene addChild:golem.spriteNode];
    [entities addObject:golem];
    [golem performActionWithFrames:golem.attackFrames];
}

+ (void) handleMove: (BOOL) isMovingLeft {
    [hero move:isMovingLeft];
}

+ (void) handleAttack {
    [hero attack];
    NSLog(@"entities count: %ld", (long)entities.count);
    for(int i = 0; i < entities.count; i++) {
        NSLog(@"here");
        Entity *entity = [entities objectAtIndex:i];
        int deltaX = hero.spriteNode.position.x - entity.spriteNode.position.x;
        NSLog(@"%d", deltaX);
        if (hero.isDirectionLeft &&
            (deltaX > 0 && deltaX <= 150)) {
            entity.health -= hero.attackPower;
            if (entity.health <= 0) {
                [entity.spriteNode removeFromParent];
                [entities removeObjectAtIndex:i];
            }
            NSLog(@"ENTITY HIT!");
            NSLog(@"%ld", (long)entity.health);
        }
    }
}

+ (void) handleJump {
    [hero jump];
}

+ (void) handleSwipe: (UISwipeGestureRecognizerDirection) direction {
    [hero dash:direction];
}

@end