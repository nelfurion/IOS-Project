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

@interface PlayViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btnMoveLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnMoveRight;
@property (weak, nonatomic) IBOutlet UIButton *btnAttack;
@property (nonatomic) SKScene *scene;
@end

#endif /* PlayViewController_h */
