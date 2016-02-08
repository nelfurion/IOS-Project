//
//  StatsViewController.m
//  SoA
//
//  Created by John Doe on 2/8/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "StatsViewController.h"
#import "Apis/Camera/CameraManager.h"
#import "AlertController.h"

static const NSString* noCameraMessage = @"Your device has no camera.";

@implementation StatsViewController

- (IBAction)choosePhoto:(UIButton *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //AlertController.alert();
        [AlertController alert:@"Error" message:noCameraMessage];
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
}
- (IBAction)takePhoto:(UIButton *)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        //AlertController.alert();
        [AlertController alert:@"Error" message:noCameraMessage];
    } else {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];

    }
}
- (IBAction)goBack:(UIButton *)sender {
    NSLog(@"popped");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.backgroundImageView setImage:[UIImage imageNamed:@"menu_background.jpg"]];
    UIImage *buttonBackground = [UIImage imageNamed:@"menuButton"];
    [self.btnChoosePhoto setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.btnTakePhoto setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    [self.btnBack setBackgroundImage:buttonBackground forState:UIControlStateNormal];
    
    [self.imageView setImage: [UIImage imageNamed:@"defaultProfileImage.jpg"]];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:   self action:@selector(choosePhoto:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.imageView addGestureRecognizer:doubleTap];
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(handlePinch:)];
    //pinchRecognizer.delegate = self.view;
    [self.imageView addGestureRecognizer:pinchRecognizer];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGestureRecognizer
{
    NSLog(@"asd");
    if (pinchGestureRecognizer.state == UIGestureRecognizerStateEnded
        || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"gesture.scale = %f", pinchGestureRecognizer.scale);
        
        CGFloat currentScale = self.imageView.frame.size.width / self.imageView.bounds.size.width;
        CGFloat newScale = currentScale * pinchGestureRecognizer.scale;
        
        if (newScale < 1) {
            newScale = 1;
        }
        if (newScale > 2) {
            newScale = 2;
        }
        
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale, newScale);
        self.imageView.transform = transform;
        pinchGestureRecognizer.scale = 1;
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [self.imageView setImage:chosenImage];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
