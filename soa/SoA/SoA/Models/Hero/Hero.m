//
//  Hero.m
//  SoA
//
//  Created by John Doe on 2/4/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import <UIKit/UIKit.h>
#import "MCSpriteLayer.h"

static NSString *const HeroClassName = @"Hero";

@implementation Hero

@synthesize framesCount;
@synthesize frames;

- (CALayer*) Animate {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Hero.png" ofType:nil];
    CGImageRef img = [UIImage imageWithContentsOfFile:path].CGImage;
    
    MCSpriteLayer *layer = [MCSpriteLayer layer];
    layer.contents = (__bridge id)img;
    
    CGSize size = CGSizeMake( 160, 198 ); // size in pixels of one frame
    CGSize normalizedSize = CGSizeMake(
                                       size.width/CGImageGetWidth(img),
                                       size.height/CGImageGetHeight(img));
    
    layer.bounds = CGRectMake(0, 0, CGImageGetWidth(img), CGImageGetHeight(img));
    layer.contentsRect = CGRectMake( 0, 0, normalizedSize.width, normalizedSize.height );
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"sampleIndex"];
    
    animation.fromValue = [NSNumber numberWithInt:1]; // initial frame
    animation.toValue = [NSNumber numberWithInt:6]; // last frame + 1
    
    animation.duration = 1.0f; // from the first frame to the 6th one in 1 second
    animation.repeatCount = HUGE_VALF; // just keep repeating it
    animation.autoreverses = YES; // do 1, 2, 3, 4, 5, 4, 3, 2
    
    [layer addAnimation:animation forKey:nil]; // start
    return layer;
    /*NSMutableArray *imageNames = [[NSMutableArray alloc] initWithCapacity:self.framesCount];
    
    // Load images
    for (NSInteger i = 0; i < self.framesCount; i++) {
        NSString *str = [NSString stringWithFormat:@"%@%ld.png", HeroClassName, i + 1];
        [imageNames addObject:str];
    }
    
    for (NSInteger i = 0; i < self.framesCount; i++) {
        NSString *name = [imageNames objectAtIndex:i];
        [self.frames addObject:[UIImage imageNamed:name]];
    }
    
    // Normal Animation
    UIImageView *animationImageView =
        [[UIImageView alloc] initWithFrame:CGRectMake(
                                                      self.positionX,
                                                      self.positionY,
                                                      self.width,
                                                      self.height)];
    animationImageView.animationImages = self.frames;
    animationImageView.animationDuration = 0.5;
    
    return animationImageView;*/
    //[self.view addSubview:animationImageView];
    //[animationImageView startAnimating];
}

- (id) init {
    if (self = [super init]) {
        self.agility = 10;
        self.strength = 10;
        self.stamina = 10;
        self.positionX = 0;
        self.positionY = 0;
        self.width = 50;
        self.height = 100;
        self.framesCount = 4;
        self.frames = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (id) heroWithDefaultStats {
    return [[Hero alloc] init];
}

@end