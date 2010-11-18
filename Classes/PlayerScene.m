//
//  PlayerScene.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "PlayerScene.h"
#import "MenuLayer.h"
#import "CircleLayer.h"

@implementation PlayerScene

+(id) scene
{
	CCScene *scene = [CCScene node];
		
	CircleLayer *circles = [CircleLayer node];
	[scene addChild:circles];
	
	MenuLayer *menu = [MenuLayer node];
	[scene addChild:menu];
	
	return scene;
}

-(id) init
{
	if( (self=[super init] ))
	{
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
