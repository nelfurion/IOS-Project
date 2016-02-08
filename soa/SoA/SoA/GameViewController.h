//
//  GameViewController.h
//  SoA
//

//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnStartGame;
@property (weak, nonatomic) IBOutlet UIButton *btnExit;
@property (weak, nonatomic) IBOutlet UIButton *btnStats;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end
