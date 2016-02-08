//
//  PlayViewController.m
//  SoA
//
//  Created by John Doe on 2/6/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

#import "PlayViewController.h"

//#import "SoA-Swift.h"
#import "Apis/Media/SoundEngine.h"
#import "Engine/Engine.h"
#import "Models/Direction.h"


//@class SoundEngine;

static SoundEngine *soundEngine;

@implementation PlayViewController
- (void)swipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"dashed");
    [Engine handleSwipe: sender.direction];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    [Engine handleJump];
}

- (void)moveLeft:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan
        || sender.state == UIGestureRecognizerStateEnded) {
        [Engine handleMove:YES];
    }
}

- (void)moveRight:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan
        || sender.state == UIGestureRecognizerStateEnded) {
        [Engine handleMove:NO];
    }
}

- (void)tap:(UITapGestureRecognizer*) sender {
    [Engine handleAttack];
}

- (void)tapSound:(UITapGestureRecognizer*) sender {
    [soundEngine toggle];
    if (self.soundIsPlaying) {
        [self.soundButton setImage:[UIImage imageNamed:@"no_sound.png"] forState:UIControlStateNormal];
        self.soundIsPlaying = NO;
    } else {
        [self.soundButton setImage:[UIImage imageNamed:@"sound.png"] forState:UIControlStateNormal];
        self.soundIsPlaying = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [Engine start:self.view];
    
    soundEngine = [[SoundEngine alloc] init];
    [soundEngine play:@"do_not_run" type:@"mp3"];
    self.soundIsPlaying = YES;
    UIImage* soundImage = [UIImage imageNamed:@"sound.png"];
    self.soundButton = [[CustomButton alloc] initWithFrame:CGRectMake(
                                                                     CGRectGetMaxX(self.view.bounds) - 40,
                                                                     CGRectGetMinY(self.view.bounds),
                                                                     40,
                                                                     40) image:soundImage];
    
    UIImage *sword = [UIImage imageNamed:@"sword2.png"];
    UIImage *move = [UIImage imageNamed:@"move.png"];
    CustomButton *moveLeftBtn = [[CustomButton alloc] initWithFrame:CGRectMake(
                                                                               CGRectGetMinX(self.view.bounds) + 40,
                                                                               CGRectGetMaxY(self.view.bounds) - 100,
                                                                               40,
                                                                               40) image:move];
    CustomButton *attackBtn = [[CustomButton alloc] initWithFrame:CGRectMake(
                                                                   CGRectGetMinX(self.view.bounds) + 90,
                                                                   CGRectGetMaxY(self.view.bounds) - 140,
                                                                   40,
                                                                   40) image:sword];
    
    CustomButton *moveRightBtn = [[CustomButton alloc] initWithFrame:CGRectMake(
                                                                             CGRectGetMaxX(self.view.bounds) - 100,
                                                                             CGRectGetMaxY(self.view.bounds) - 100,
                                                                             40,
                                                                             40) image:move];
    
    [self.view addSubview:attackBtn];
    [self.view addSubview:moveLeftBtn];
    [self.view addSubview:moveRightBtn];
    
    [self.view addSubview:self.soundButton];
    UITapGestureRecognizer *tapSoundRecognizer =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSound:)];
    [self.soundButton addGestureRecognizer:tapSoundRecognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [attackBtn addGestureRecognizer:tapRecognizer];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeLeftRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeRightRecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [panRecognizer requireGestureRecognizerToFail:swipeRightRecognizer];
    [panRecognizer requireGestureRecognizerToFail:swipeLeftRecognizer];
    [self.view addGestureRecognizer:panRecognizer];
    
    UILongPressGestureRecognizer *longPressLeftRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft:)];
    [moveLeftBtn addGestureRecognizer:longPressLeftRecognizer];
    
    UILongPressGestureRecognizer *longPressRightRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    [moveRightBtn addGestureRecognizer:longPressRightRecognizer];
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