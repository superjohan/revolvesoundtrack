//
//  CircleLayer.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "CircleLayer.h"

@implementation CircleLayer

@synthesize background1;
@synthesize background2;
@synthesize background3;

#pragma mark Public

- (void)showBackground1
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
}

- (void)showBackground2
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
}

- (void)showBackground3
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
}

- (id)init
{	
	self = [super init];
	
	if(self != nil)
	{
		self.isTouchEnabled = NO;
		
		self.background1 = [CCSprite spriteWithFile:@"background.png"];
		self.background1.scale = 1024;
		self.background1.position = ccp(512,384);
		self.background1.opacity = 255;
		[self addChild:self.background1 z:1];		

		self.background2 = [CCSprite spriteWithFile:@"background-2.png"];
		self.background2.scale = 1024;
		self.background2.position = ccp(512,384);
		self.background2.opacity = 0;
		[self addChild:self.background2 z:1];		

		self.background3 = [CCSprite spriteWithFile:@"background-3.png"];
		self.background3.scale = 1024;
		self.background3.position = ccp(512,384);
		self.background3.opacity = 0;
		[self addChild:self.background3 z:1];		
	}
	
	return self;
}

- (void)dealloc
{
	self.background1 = nil;
	self.background2 = nil;
	self.background3 = nil;
	
	[super dealloc];
}

@end
