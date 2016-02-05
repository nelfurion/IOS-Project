//
//  Animatable.h
//  SoA
//
//  Created by John Doe on 2/3/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef Animatable_h
#define Animatable_h

#import <UIKit/UIKit.h>

@protocol Animatable <NSObject>

@property (strong, nonatomic) NSMutableArray *frames;
@property (nonatomic) NSInteger framesCount;

- (CALayer*) Animate;

@end

#endif /* Animatable_h */
