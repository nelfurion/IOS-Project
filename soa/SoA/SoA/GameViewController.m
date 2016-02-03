//
//  GameViewController.m
//  SoA
//
//  Created by John Doe on 2/2/16.
//  Copyright (c) 2016 John Doe. All rights reserved.
//

#import "GameViewController.h"

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 50, 50)];
    test.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:test];
    self.view.backgroundColor = [UIColor greenColor];
    NSMutableArray *imageNames = [[NSMutableArray alloc] initWithCapacity:4];
    
    //NSString *basePath = @"/Users/johndoe/Desktop/soa/SoA/SoA/Models/firefly/";
    // Load images
    for (NSInteger i = 0; i < 4; i++) {
        //NSMutableString *fullPath = [NSMutableString stringWithString:basePath];
        //[fullPath appendFormat:];
        NSString *str = [NSString stringWithFormat:@"SMALL_000%ld_Capa-%ld.png", i, i + 1];
        [imageNames addObject:str];
//        [fullPath appendString:@"SMALL_0000_Capa-1.png"];
        
    }
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < imageNames.count; i++) {
        NSString *name = [imageNames objectAtIndex:i];
        [images addObject:[UIImage imageNamed:name]];
    }
    
    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
}


@end
