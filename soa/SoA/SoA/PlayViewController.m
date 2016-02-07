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


@implementation PlayViewController
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swiped");
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    [Engine handleJump];
}

- (IBAction)moveLeft:(id)sender {
    [Engine handleJump];
    //[Engine handleMoveLeft];
}

- (IBAction)moveRight:(id)sender {
    [Engine handleMoveRight];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [Engine start:self.view];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];

    [self.view addGestureRecognizer:panRecognizer];
    
    //[Engine start];
    
    //[self startGame];
    
        
    // Configure the view.
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