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

#import "Apis/Media/SoundEngine.h"
#import "Engine/Engine.h"
#import "Models/Direction.h"


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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.btnMoveLeft removeTarget:nil
                       action:NULL
             forControlEvents:UIControlEventAllEvents];
    [self.btnMoveRight removeTarget:nil
                       action:NULL
             forControlEvents:UIControlEventAllEvents];
    [Engine start:self.view];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.btnAttack addGestureRecognizer:tapRecognizer];
    
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
    [self.btnMoveLeft addGestureRecognizer:longPressLeftRecognizer];
    
    UILongPressGestureRecognizer *longPressRightRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    [self.btnMoveRight addGestureRecognizer:longPressRightRecognizer];
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