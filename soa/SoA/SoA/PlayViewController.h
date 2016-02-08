//
//  PlayViewController.h
//  SoA
//
//  Created by John Doe on 2/6/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef PlayViewController_h
#define PlayViewController_h

#import <UIKit/UIKit.h>

#import "CustomViews/CustomButton.h"

@interface PlayViewController : UIViewController
@property (strong, nonatomic) CustomButton *soundButton;
@property (nonatomic) SKScene *scene;
@property (nonatomic) BOOL soundIsPlaying;
@end

#endif /* PlayViewController_h */
