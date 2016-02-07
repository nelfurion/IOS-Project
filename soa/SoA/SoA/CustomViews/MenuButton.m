//
//  MenuButton.m
//  SoA
//
//  Created by John Doe on 2/6/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MenuButton.h"

@implementation MenuButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        UIImage* image = [UIImage imageNamed:@"menuButton.png"];
        [self setTitle:@"Start" forState:UIControlStateNormal];
        [self.titleLabel setNumberOfLines:0];
        //[self setBackgroundImage:image forState:UIControlStateNormal];
        
        [self setBackgroundImage:image forState:UIControlStateNormal];
        //[self addSubview:button];
    }
    return self;
}

/*- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextAddRect(context, self.frame);
    CGContextStrokePath(context);
}*/

@end