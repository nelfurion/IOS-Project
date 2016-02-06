//
//  PlayViewController.m
//  SoA
//
//  Created by John Doe on 2/6/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#import "PlayViewController.h"

#import "MyScene.h"
#import "Apis/Media/SoundEngine.h"
#import "Engine/Engine.h"


@implementation PlayViewController
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swiped");
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    NSLog(@"panned");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [self.view addGestureRecognizer:panRecognizer];
    
    //[Engine start];
    
    //[self startGame];
    
    /*SoundEngine* engine = [[SoundEngine alloc] init];
    [engine bing];
    [engine initOpenAL];
    [engine playAudioFile];
    NSLog(@"sound supposedly played");*/
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    self.scene = [MyScene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:self.scene];
    
    CGSize groundSize = CGSizeMake(self.scene.frame.size.width + 1, 100);
    SKSpriteNode *ground = [SKSpriteNode spriteNodeWithColor:[UIColor brownColor] size:groundSize];
    ground.position = CGPointMake(CGRectGetMidX(self.scene.frame), CGRectGetMinY(self.scene.frame) + 100);
    if(ground.texture == NULL) {
        NSLog(@"ground texture is null");
    }
    SKPhysicsBody *groundBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody = groundBody;
    groundBody.dynamic = NO;
    [self.scene addChild:ground];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end