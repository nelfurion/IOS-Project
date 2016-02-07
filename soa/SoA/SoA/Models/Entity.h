//
//  Entity.h
//  SoA
//
//  Created by John Doe on 2/7/16.
//  Copyright © 2016 John Doe. All rights reserved.
//

#ifndef Entity_h
#define Entity_h

#import <SpriteKit/SpriteKit.h>

@interface Entity : NSObject

@property (nonatomic) NSInteger positionX;
@property (nonatomic) NSInteger positionY;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;

@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger attackPower;

@property (strong, nonatomic) NSMutableArray* idleFrames;
@property (strong, nonatomic) NSMutableArray* walkFrames;
@property (strong, nonatomic) NSMutableArray* attackFrames;
@property (strong, nonatomic) SKSpriteNode* spriteNode;

- (instancetype) init;

- (instancetype) initWithAnimationsData;

- (void) performActionWithFrames: (NSMutableArray*) frames;

@end

#endif /* Entity_h */
