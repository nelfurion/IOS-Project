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
#import "../Apis/Media/SoundEngine.h"
#import "../CustomViews/CustomButton.h"
#import "../AlertController.h"


@class LevelManager;

@implementation  Engine

+ (void) start: (UIView*) view {
    entities = [NSMutableArray array];
   
    
    
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
    
    
    Golem *golem = [Golem golemWithDefaultSettings];
    golem.spriteNode.position = CGPointMake(CGRectGetMidX(scene.frame) + 100, CGRectGetMaxY(scene.frame) - hero.spriteNode.size.height / 2);
    [scene addChild:golem.spriteNode];
    [entities addObject:golem];
    
    [golem performActionWithFrames:golem.idleFrames];
    /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [golem watchOutForTarget:hero];
    });*/
    
    
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
        if ((hero.isDirectionLeft && (deltaX > 0 && deltaX <= 150)) ||
            (!hero.isDirectionLeft && (deltaX <= 0 && deltaX >= -150))) {
            entity.health -= hero.attackPower;
            [entity performActionWithFrames:entity.attackFrames];
            hero.health -= entity.attackPower;
            if (entity.health <= 0) {
                [entity.spriteNode removeFromParent];
                [entities removeObjectAtIndex:i];
                if (entities.count == 0) {
                    [self win];
                }
            }
            
            if (hero.health <= 0) {
                [hero.spriteNode removeFromParent];
                [self lose];
            }
            
            NSLog(@"ENTITY HIT!");
            NSLog(@"ENTITY HEALTH: %ld", (long)entity.health);
            
            NSLog(@"HERO HIT!");
            NSLog(@"HERO HEALTH: %ld", (long)hero.health);
        }
    }
}

+ (void) lose {
    [AlertController alert:@"WASTED" message:@"You dead."];
}

+ (void) win {
    [AlertController alert:@"Good job!" message:@"Nice moves."];
}

+ (void) handleJump {
    [hero jump];
}

+ (void) handleSwipe: (UISwipeGestureRecognizerDirection) direction {
    [hero dash:direction];
}

@end