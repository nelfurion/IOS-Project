//
//  StatsViewController.h
//  SoA
//
//  Created by John Doe on 2/8/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef StatsViewController_h
#define StatsViewController_h

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIButton *btnTakePhoto;
@property (weak, nonatomic) IBOutlet UIButton *btnChoosePhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@end

#endif /* StatsViewController_h */
