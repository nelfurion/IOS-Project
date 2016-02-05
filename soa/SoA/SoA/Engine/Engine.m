//
//  Engine.m
//  SoA
//
//  Created by John Doe on 2/5/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Engine.h"
#import "../Models/Hero/Hero.h"

@implementation  Engine

+ (void) start {
    Hero *hero = [Hero heroWithDefaultStats];
}

@end