//
//  CircleLayer.h
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CircleLayer : CCLayer 
{

}

@property (nonatomic, retain) CCSprite *background1;
@property (nonatomic, retain) CCSprite *background2;
@property (nonatomic, retain) CCSprite *background3;

- (void)showBackground1;
- (void)showBackground2;
- (void)showBackground3;

@end
