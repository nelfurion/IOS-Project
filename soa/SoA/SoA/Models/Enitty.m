//
//  Enitty.m
//  SoA
//
//  Created by John Doe on 2/7/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"

@implementation Entity

- (instancetype) init {
    NSLog(@"You must implement init method!");
    return [super init];
}

- (instancetype) initWithAnimationsData{
    NSLog(@"You must implement initWithAnimationsData method!");
    return [super init];
}
- (void) performActionWithFrames: (NSMutableArray*) frames{
    NSLog(@"You must implement performActionWithFrames method!");
}
@end