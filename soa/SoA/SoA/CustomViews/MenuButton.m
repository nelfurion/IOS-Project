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
        NSString* imageName = [[NSBundle mainBundle] pathForResource:@"menuButton" ofType:@"png"];
        UIButton *button = [[UIButton alloc] initWithFrame:frame];
        //button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imageName]];
        button.backgroundColor = [UIColor purpleColor];
        [self addSubview:button];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextAddRect(context, self.bounds);
    CGContextStrokePath(context);
}

@end