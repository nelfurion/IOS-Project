//
//  GameViewController.h
//  SoA
//

//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *choosePhotoBtn;

@property (weak, nonatomic) IBOutlet UIButton *takePhotoBtn;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end
