//
//  GameViewController.m
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import "GameViewController.h"
#import "Models/Hero/Hero.h"

#import "CustomViews/MenuButton.h"
#import "Apis/Camera/CameraManager.h"
#import "Apis/Media/SoundEngine.h"

@implementation GameViewController

- (IBAction)takePhoto:(id)sender {
    CameraManager *manager = [[CameraManager alloc] initWithController:self];
    [manager takePhoto];
}

- (IBAction)choosePhotoFromGallery:(id)sender {
    CameraManager *manager = [[CameraManager alloc] initWithController:self];
    [manager choosePhotoFromGallery];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //MenuButton *menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    //[self.view addSubview:menuButton];
    
    /*SoundEngine* engine = [[SoundEngine alloc] init];
    [engine bing];
    [engine initOpenAL];
    [engine playAudioFile];
    NSLog(@"sound supposedly played");*/
    
    
    [self.backgroundImageView setImage:[UIImage imageNamed:@"menu_background.jpg"]];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //[swipeRecognizer setDelegate:self];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeRecognizer];
    UIImage *buttonBackground = [UIImage imageNamed:@"menuButton"];
    [self.takePhotoBtn setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.choosePhotoBtn setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.btnStartGame setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    /*- (void) viewDidLoad {
     [super viewDidLoad];
     
     
     
     Hero *hero = [Hero heroWithDefaultStats];
     CALayer *heroAnimationLayer = [hero Animate];
     [self.view.layer addSublayer:heroAnimationLayer];
     }*/
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
}

@end
