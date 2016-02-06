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

@implementation GameViewController
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    NSLog(@"panned");
}
- (IBAction)screenEdgePan:(UIScreenEdgePanGestureRecognizer *)sender {
    NSLog(@"screen edge pan");
}
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    NSLog(@"swiped");
}
- (IBAction)longPress:(UILongPressGestureRecognizer *)sender {
    NSLog(@"long pressed");
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    NSLog(@"tapped");
}


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
    MenuButton *menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    [self.view addSubview:menuButton];
    
    NSString *menuBackgroundPath = [[NSBundle mainBundle] pathForResource:@"menu_background.jpg" ofType:nil];
    
    UIImage *background = [UIImage imageWithContentsOfFile:menuBackgroundPath];
    
    [self.backgroundImageView setImage:background];
    
    [self.view bringSubviewToFront:self.takePhotoBtn];
    [self.view bringSubviewToFront:self.choosePhotoBtn];
    
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    //[swipeRecognizer setDelegate:self];
    [swipeRecognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeRecognizer];
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action: @selector(pan:)];
    
    [self.view addGestureRecognizer:panRecognizer];
    
    /*- (void) viewDidLoad {
     [super viewDidLoad];
     
     SoundEngine* engine = [[SoundEngine alloc] init];
     [engine bing];
     [engine initOpenAL];
     [engine playAudioFile];
     NSLog(@"sound supposedly played");
     
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
