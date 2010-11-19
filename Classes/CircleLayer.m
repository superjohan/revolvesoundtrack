//
//  CircleLayer.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "CircleLayer.h"

@interface CircleLayer()
@property (nonatomic, retain) CCSprite *background1;
@property (nonatomic, retain) CCSprite *background2;
@property (nonatomic, retain) CCSprite *background3;
@property (nonatomic, retain) CCSprite *red1;
@property (nonatomic, retain) CCSprite *red2;
@property (nonatomic, retain) CCSprite *red3;
@property (nonatomic, retain) CCSprite *green1;
@property (nonatomic, retain) CCSprite *green2;
@property (nonatomic, retain) CCSprite *green3;
@property (nonatomic, retain) CCSprite *blue1;
@property (nonatomic, retain) CCSprite *blue2;
@property (nonatomic, retain) CCSprite *blue3;
@property (nonatomic) float timer;
@end

@implementation CircleLayer

@synthesize background1;
@synthesize background2;
@synthesize background3;
@synthesize red1;
@synthesize red2;
@synthesize red3;
@synthesize green1;
@synthesize green2;
@synthesize green3;
@synthesize blue1;
@synthesize blue2;
@synthesize blue3;
@synthesize timer;

#pragma mark Private

- (void)_configureCircles
{
	self.red1 = [CCSprite spriteWithFile:@"red-1.png"];
	self.red1.opacity = 0;
	self.red1.position = ccp(512,500);
	[self addChild:self.red1 z:4];
	self.red2 = [CCSprite spriteWithFile:@"red-2.png"];
	self.red2.opacity = 0;
	self.red2.position = ccp(512,500);
	[self addChild:self.red2 z:4];
	self.red3 = [CCSprite spriteWithFile:@"red-3.png"];
	self.red3.opacity = 0;
	self.red3.position = ccp(512,500);
	[self addChild:self.red3 z:4];
	
	self.green1 = [CCSprite spriteWithFile:@"green-1.png"];
	self.green1.opacity = 0;
	self.green1.position = ccp(412,300);
	[self addChild:self.green1 z:2];
	self.green2 = [CCSprite spriteWithFile:@"green-2.png"];
	self.green2.opacity = 0;
	self.green2.position = ccp(412,300);
	[self addChild:self.green2 z:2];
	self.green3 = [CCSprite spriteWithFile:@"green-3.png"];
	self.green3.opacity = 0;
	self.green3.position = ccp(412,300);
	[self addChild:self.green3 z:2];
	
	self.blue1 = [CCSprite spriteWithFile:@"blue-1.png"];
	self.blue1.opacity = 0;
	self.blue1.position = ccp(612,300);
	[self addChild:self.blue1 z:3];
	self.blue2 = [CCSprite spriteWithFile:@"blue-2.png"];
	self.blue2.opacity = 0;
	self.blue2.position = ccp(612,300);
	[self addChild:self.blue2 z:3];
	self.blue3 = [CCSprite spriteWithFile:@"blue-3.png"];
	self.blue3.opacity = 0;
	self.blue3.position = ccp(612,300);
	[self addChild:self.blue3 z:3];
}

- (void)_configureBackground
{
	self.background1 = [CCSprite spriteWithFile:@"background.png"];
	self.background1.scale = 1024;
	self.background1.position = ccp(512,384);
	self.background1.opacity = 0;
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

- (CGFloat)_xForPosition:(CGFloat)thePosition
{
	return (cos(thePosition) * 116) + (sin(self.timer / 2) * 100);
}

- (CGFloat)_yForPosition:(CGFloat)thePosition
{
	return (sin(thePosition) * 116) + (cos(self.timer / 2) * 100);
}

- (void)_mainLoop:(ccTime)dt
{
	self.timer = self.timer + dt;
	
	CGFloat redPosition = self.timer + M_PI;
	CGFloat greenPosition = self.timer + (M_PI * 1.666666f);
	CGFloat bluePosition = self.timer + (M_PI / 3);
	
	self.red1.position = ccp(512 + [self _xForPosition:redPosition], 384 + [self _yForPosition:redPosition]);
	self.red2.position = ccp(512 + [self _xForPosition:redPosition], 384 + [self _yForPosition:redPosition]);
	self.red3.position = ccp(512 + [self _xForPosition:redPosition], 384 + [self _yForPosition:redPosition]);
	self.green1.position = ccp(512 + [self _xForPosition:greenPosition], 384 + [self _yForPosition:greenPosition]);
	self.green2.position = ccp(512 + [self _xForPosition:greenPosition], 384 + [self _yForPosition:greenPosition]);
	self.green3.position = ccp(512 + [self _xForPosition:greenPosition], 384 + [self _yForPosition:greenPosition]);
	self.blue1.position = ccp(512 + [self _xForPosition:bluePosition], 384 + [self _yForPosition:bluePosition]);
	self.blue2.position = ccp(512 + [self _xForPosition:bluePosition], 384 + [self _yForPosition:bluePosition]);
	self.blue3.position = ccp(512 + [self _xForPosition:bluePosition], 384 + [self _yForPosition:bluePosition]);
}

#pragma mark Public

- (void)showBackground1
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 

	[self.red1 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.red2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.red3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green1 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.green2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue1 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.blue2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
}

- (void)showBackground2
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	
	[self.red1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.red2 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.red3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green2 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.green3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue2 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.blue3 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
}

- (void)showBackground3
{
	[self.background1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.background3 runAction:[CCFadeTo actionWithDuration:1 opacity:255]];	 
	
	[self.red1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.red2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.red3 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.green1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.green3 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
	[self.blue1 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue2 runAction:[CCFadeTo actionWithDuration:1 opacity:0]];	 
	[self.blue3 runAction:[CCFadeTo actionWithDuration:1 opacity:192]];	 
}

- (id)init
{	
	self = [super init];
	
	if(self != nil)
	{
		self.isTouchEnabled = NO;
		
		[self _configureBackground];
		[self _configureCircles];

		self.timer = 0;
		
		[self showBackground1];
		
		[self schedule:@selector(_mainLoop:)];
	}
	
	return self;
}

- (void)dealloc
{
	self.background1 = nil;
	self.background2 = nil;
	self.background3 = nil;
	self.red1 = nil;
	self.red2 = nil;
	self.red3 = nil;
	self.green1 = nil;
	self.green2 = nil;
	self.green3 = nil;
	self.blue1 = nil;
	self.blue2 = nil;
	self.blue3 = nil;
	
	[super dealloc];
}

@end
