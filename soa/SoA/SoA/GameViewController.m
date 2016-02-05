//
//  GameViewController.m
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import "GameViewController.h"
#import "Models/Hero/Hero.h"
#import "SoundEngine.h"

#import "MCSpriteLayer.h"
#import "Apis/Camera/CameraManager.h"

@implementation GameViewController

- (IBAction)takePhoto:(id)sender {
    CameraManager *manager = [[CameraManager alloc] initWithController:self];
    [manager handleCameraNotSupported];
    [manager takePhoto];
}

- (IBAction)choosePhotoFromGallery:(id)sender {
    CameraManager *manager = [[CameraManager alloc] initWithController:self];
    [manager choosePhotoFromGallery];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
    SoundEngine* engine = [[SoundEngine alloc] init];
    [engine bing];
    [engine initOpenAL];
    [engine playAudioFile];
    
    UIView *myBox  = [[UIView alloc] initWithFrame:CGRectMake(180, 35, 100, 100)];
    myBox.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:myBox];
}

- (void)displayLayer:(CALayer *)layer;
{
    static const CGRect sampleRects[11] = {
        { 0, 0, 38, 47 },       // run
        { 0, 47, 46, 47 },
        { 82, 0, 40, 47 },
        { 122, 0, 30, 47 },
        { 152, 0, 36, 47 },
        { 38, 0, 44, 47 },
        { 188, 0, 42, 47 },
        { 230, 0, 26, 47 },
        { 46, 47, 28, 47 },     // idle
        { 74, 47, 28, 47 },
        { 102, 47, 28, 47 },
    };
    
    MCSpriteLayer *spriteLayer = (MCSpriteLayer*)layer;
    unsigned int idx = [spriteLayer currentSampleIndex];
    if (idx == 0)
        return;
    
    spriteLayer.bounds = CGRectMake(0, 0, sampleRects[idx-1].size.width, sampleRects[idx-1].size.height);
    spriteLayer.contentsRect = CGRectMake(sampleRects[idx-1].origin.x/256.0f, sampleRects[idx-1].origin.y/128.0f, sampleRects[idx-1].size.width/256.0f, sampleRects[idx-1].size.height/128.0f);
}


@end
