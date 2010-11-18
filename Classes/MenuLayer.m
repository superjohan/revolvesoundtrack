//
//  MenuLayer.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "MenuLayer.h"
#import "SimpleAudioEngine.h"

@interface MenuLayer()
@property (nonatomic) NSInteger trackPlaying;
@property (nonatomic, retain) CCMenu *trackMenu;
@property (nonatomic) BOOL menuVisible;
@property (nonatomic, retain) CCMenuItem *track1;
@property (nonatomic, retain) CCMenuItem *track2;
@property (nonatomic, retain) CCMenuItem *track3;
@property (nonatomic, retain) CCMenuItem *track4;
@property (nonatomic, retain) CCMenuItem *track5;
@property (nonatomic, retain) CCMenuItem *track6;
@end

@implementation MenuLayer

@synthesize trackPlaying;
@synthesize circles;
@synthesize trackMenu;
@synthesize menuVisible;
@synthesize track1;
@synthesize track2;
@synthesize track3;
@synthesize track4;
@synthesize track5;
@synthesize track6;

#pragma mark Private

- (void)_track1Selected:(id)sender
{
	if(self.trackPlaying != 1)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"01.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"01.m4a" loop:YES];
		
		[self.circles showBackground1];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:64 green:43 blue:10]];
		self.trackPlaying = 1;
	}
}

- (void)_track2Selected:(id)sender
{
	if(self.trackPlaying != 2)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"02.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"02.m4a" loop:YES];
		
		[self.circles showBackground2];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:10 green:32 blue:65]];
		self.trackPlaying = 2;
	}
}

- (void)_track3Selected:(id)sender
{
	if(self.trackPlaying != 3)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"03.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"03.m4a" loop:YES];
		
		[self.circles showBackground3];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:190 green:212 blue:245]];
		self.trackPlaying = 3;
	}
}

- (void)_track4Selected:(id)sender
{
	if(self.trackPlaying != 4)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"04.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"04.m4a" loop:YES];
		
		[self.circles showBackground3];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:190 green:212 blue:245]];
		self.trackPlaying = 4;
	}
}

- (void)_track5Selected:(id)sender
{
	if(self.trackPlaying != 5)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"05.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"05.m4a" loop:YES];
		
		[self.circles showBackground2];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:10 green:32 blue:65]];
		self.trackPlaying = 5;
	}
}

- (void)_track6Selected:(id)sender
{
	if(self.trackPlaying != 6)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"06.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"06.m4a" loop:YES];
		
		[self.circles showBackground3];
		[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:190 green:212 blue:245]];
		self.trackPlaying = 6;
	}
}

- (void)_toggleMenu:(id)sender
{
	if(self.menuVisible)
	{
		[self.trackMenu runAction:[CCFadeTo actionWithDuration:1 opacity:0]];
		self.menuVisible = NO;
	}
	else 
	{
		[self.trackMenu runAction:[CCFadeTo actionWithDuration:1 opacity:255]];
		self.menuVisible = YES;
	}
}

#pragma mark Public

-(id)init
{	
	self = [super init];
	
	if(self != nil)
	{
		self.isTouchEnabled = YES;
		
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"01.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"01.m4a" loop:YES];
		self.trackPlaying = 1;
		
		[CCMenuItemFont setFontName:@"MonkeyLove"];
		[CCMenuItemFont setFontSize:48];
		
		self.track1 = [CCMenuItemFont itemFromString:@"day (another version)" target:self selector:@selector(_track1Selected:)];
		self.track2 = [CCMenuItemFont itemFromString:@"evening" target:self selector:@selector(_track2Selected:)];
		self.track3 = [CCMenuItemFont itemFromString:@"night" target:self selector:@selector(_track3Selected:)];
		self.track4 = [CCMenuItemFont itemFromString:@"night (johan's low frequency remix)" target:self selector:@selector(_track4Selected:)];
		self.track5 = [CCMenuItemFont itemFromString:@"evening (beatless version)" target:self selector:@selector(_track5Selected:)];
		self.track6 = [CCMenuItemFont itemFromString:@"night (beatless version)" target:self selector:@selector(_track6Selected:)];
		
		self.track1.anchorPoint = ccp(0,0);
		self.track1.position = ccp(30,350);
		self.track2.anchorPoint = ccp(0,0);
		self.track2.position = ccp(30,300);
		self.track3.anchorPoint = ccp(0,0);
		self.track3.position = ccp(30,250);
		self.track4.anchorPoint = ccp(0,0);
		self.track4.position = ccp(30,200);
		self.track5.anchorPoint = ccp(0,0);
		self.track5.position = ccp(30,150);
		self.track6.anchorPoint = ccp(0,0);
		self.track6.position = ccp(30,100);
		
		self.trackMenu = [CCMenu menuWithItems:self.track1, self.track2, self.track3, self.track4, self.track5, self.track6, nil];
		self.trackMenu.color = ccc3(64,43,10);
		self.trackMenu.position = CGPointZero;
		self.trackMenu.opacity = 255;
		[self addChild:self.trackMenu z:5];
		
		CCSprite *menuButtonSprite = [CCSprite spriteWithFile:@"menu.png"];
		CCMenuItem *menuButton = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite selectedSprite:menuButtonSprite target:self selector:@selector(_toggleMenu:)];
		menuButton.position = ccp(30, 30);
		menuButton.anchorPoint = ccp(0,0);
		CCMenu *menuButtonMenu = [CCMenu menuWithItems:menuButton, nil];
		menuButtonMenu.position = CGPointZero;
		[self addChild:menuButtonMenu z:5];
		
		self.menuVisible = YES;
	}
	
	return self;
}

- (void)dealloc
{
	self.circles = nil;
	self.trackMenu = nil;
	self.track1 = nil;
	self.track2 = nil;
	self.track3 = nil;
	self.track4 = nil;
	self.track5 = nil;
	self.track6 = nil;
	
	[super dealloc];
}

@end
