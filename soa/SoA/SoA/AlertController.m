//
//  AlertController.m
//  SoA
//
//  Created by John Doe on 2/8/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlertController.h"
#import <UIKit/UIKit.h>

@implementation AlertController

+ (void) alert: (NSString*) title message: (NSString*) message {
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:title
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles: nil];
    
    [myAlertView show];
}

@end