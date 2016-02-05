//
//  CameraManager.h
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef CameraManager_h
#define CameraManager_h
#import <UIKit/UIKit.h>

@interface CameraManager: NSObject

@property (nonatomic) UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> *uiViewController;

- (void) takePhoto;

- (void) choosePhotoFromGallery;

- (UIImage*)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

- (id) initWithController: (UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> *) controller;

- (void) handleCameraNotSupported;

@end

#endif /* CameraManager_h */
