//
//  MCSpriteLayer.h
//  SoA
//
//  Created by John Doe on 2/4/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface MCSpriteLayer : CALayer {
    unsigned int sampleIndex;
}

// SampleIndex needs to be > 0
@property (readwrite, nonatomic) unsigned int sampleIndex;

// For use with sample rects set by the delegate
+ (id)layerWithImage:(CGImageRef)img;
- (id)initWithImage:(CGImageRef)img;

// If all samples are the same size
+ (id)layerWithImage:(CGImageRef)img sampleSize:(CGSize)size;
- (id)initWithImage:(CGImageRef)img sampleSize:(CGSize)size;

// Use this method instead of sprite.sampleIndex to obtain the index currently displayed on screen
- (unsigned int)currentSampleIndex;

@end
