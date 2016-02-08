//
//  MenuButton.m
//  SoA
//
//  Created by John Doe on 2/6/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame image: (UIImage*) image
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // Set the border width
    CGContextSetLineWidth(contextRef, 1.0);
    
    // Fill the circle with the fill color
    CGContextFillEllipseInRect(contextRef, rect);
    
    // Draw the circle border
    CGContextStrokeEllipseInRect(contextRef, rect);
}

@end