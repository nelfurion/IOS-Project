//
//  CameraManager.m
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CameraManager.h"
#import <UIKit/UIKit.h>

@implementation CameraManager

- (void) takePhoto {
    [self handleCameraNotSupported];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self.uiViewController;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self.uiViewController presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)choosePhotoFromGallery {
    [self handleCameraNotSupported];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self.uiViewController;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self.uiViewController presentViewController:picker animated:YES completion:NULL];
}

- (UIImage*)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self handleCameraNotSupported];
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
    return chosenImage;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self handleCameraNotSupported];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (id) initWithController: (UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> *) controller {
    if (self = [super init]) {
        self.uiViewController = controller;
    }
    
    return self;
}

@end

