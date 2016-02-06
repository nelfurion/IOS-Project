//
//  MyScene.m
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "MyScene.h"
#import "Models/Hero/Hero.h"
#import "Models/Golem/Golem.h"

@implementation MyScene {
    
    SKSpriteNode *_bear;
    NSArray *_bearWalkingFrames;
    
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {

        self.backgroundColor = [SKColor blackColor];

        Hero *hero = [Hero heroWithDefaultSettings];
        hero.spriteNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.frame) - hero.spriteNode.size.height / 2);
        [self addChild:hero.spriteNode];
        
        //Start the bear walking
        //[self walkingBear];
        
        [hero performActionWithFrames:hero.walkFrames];
        
        Golem *golem = [Golem golemWithDefaultSettings];
        golem.spriteNode.position = CGPointMake(CGRectGetMidX(self.frame) + 100, CGRectGetMaxY(self.frame) - hero.spriteNode.size.height / 2);
        [self addChild:golem.spriteNode];
        [golem performActionWithFrames:golem.attackFrames];
    }
    
    return self;
}


-(void)bearMoveEnded
{
    [_bear removeAllActions];
}

-(void)walkingBear
{
    //This is our general runAction method to make our bear walk.
    //By using a withKey if this gets called while already running it will remove the first action before
    //starting this again.
    
    
    return;
}

/*
//touches ended handler for part 1
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint location = [[touches anyObject] locationInNode:self];
    CGFloat multiplierForDirection;
    
    if (location.x <= CGRectGetMidX(self.frame)) {
        //walk left
        multiplierForDirection = 1;
    } else {
        //walk right
        multiplierForDirection = -1;
    }
    
    _bear.xScale = fabs(_bear.xScale) * multiplierForDirection;
    
    [self walkingBear];
    
}
*/

//touches ended handler for part 2
/*-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint location = [[touches anyObject] locationInNode:self];
    CGFloat multiplierForDirection;
    
    CGSize screenSize = self.frame.size;
    
    float bearVelocity = screenSize.width / 3.0;
    
    //x and y distances for move
    CGPoint moveDifference = CGPointMake(location.x - _bear.position.x, location.y - _bear.position.y);
    float distanceToMove = sqrtf(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y);
    
    float moveDuration = distanceToMove / bearVelocity;
    
    if (moveDifference.x < 0) {
        multiplierForDirection = 1;
    } else {
        multiplierForDirection = -1;
    }
    _bear.xScale = fabs(_bear.xScale) * multiplierForDirection;
    
    if ([_bear actionForKey:@"bearMoving"]) {
        //stop just the moving to a new location, but leave the walking legs movement running
        [_bear removeActionForKey:@"bearMoving"];
    }
    
    if (![_bear actionForKey:@"walkingInPlaceBear"]) {
        //if legs are not moving go ahead and start them
        [self walkingBear];  //start the bear walking
    }
    
    SKAction *moveAction = [SKAction moveTo:location duration:moveDuration];
    SKAction *doneAction = [SKAction runBlock:(dispatch_block_t)^() {
        NSLog(@"Animation Completed");
        [self bearMoveEnded];
    }];
    
    SKAction *moveActionWithDone = [SKAction sequence:@[moveAction,doneAction ]];
    
    [_bear runAction:moveActionWithDone withKey:@"bearMoving"];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}*/

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}


@end
