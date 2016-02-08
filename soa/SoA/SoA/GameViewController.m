//
//  GameViewController.m
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import "GameViewController.h"

#import "SoA-Swift.h"

//#import "CustomViews/SoundButton.h"

//#import "Apis/Media/SoundEngine.h"

@implementation GameViewController

- (IBAction)exitGame:(UIButton *)sender {
    //[[NSThread mainThread] cancel]; doesnt work
    exit(0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*engine = [[SoundEngine alloc] init];
    [engine play:@"do_not_run" type:@"mp3"];*/
    
    [self.backgroundImageView setImage:[UIImage imageNamed:@"menu_background.jpg"]];

    UIImage *buttonBackground = [UIImage imageNamed:@"menuButton"];
    [self.btnExit setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.btnStats setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.btnStartGame setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //Alert* controller = [[Alert alloc] init];
        //[controller alert];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction)unwindToGame:(UIStoryboardSegue *)unwindSegue
{
}


@end
