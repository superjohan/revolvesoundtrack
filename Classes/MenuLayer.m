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
@end

@implementation MenuLayer

@synthesize trackPlaying;
@synthesize circleLayer;
@synthesize trackMenu;
@synthesize menuVisible;

#pragma mark Private

- (void)_track1Selected:(id)sender
{
	if(self.trackPlaying != 1)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"01.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"01.m4a" loop:YES];
	}
}

- (void)_track2Selected:(id)sender
{
	if(self.trackPlaying != 2)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"02.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"02.m4a" loop:YES];
	}
}

- (void)_track3Selected:(id)sender
{
	if(self.trackPlaying != 3)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"03.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"03.m4a" loop:YES];
	}
}

- (void)_track4Selected:(id)sender
{
	if(self.trackPlaying != 4)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"04.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"04.m4a" loop:YES];
	}
}

- (void)_track5Selected:(id)sender
{
	if(self.trackPlaying != 5)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"05.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"05.m4a" loop:YES];
	}
}

- (void)_track6Selected:(id)sender
{
	if(self.trackPlaying != 6)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"06.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"06.m4a" loop:YES];
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
		
		CCMenuItem *track1 = [CCMenuItemFont itemFromString:@"day (another version)" target:self selector:@selector(_track1Selected:)];
		CCMenuItem *track2 = [CCMenuItemFont itemFromString:@"evening" target:self selector:@selector(_track2Selected:)];
		CCMenuItem *track3 = [CCMenuItemFont itemFromString:@"night" target:self selector:@selector(_track3Selected:)];
		CCMenuItem *track4 = [CCMenuItemFont itemFromString:@"night (johan's low frequency remix)" target:self selector:@selector(_track4Selected:)];
		CCMenuItem *track5 = [CCMenuItemFont itemFromString:@"evening (beatless version)" target:self selector:@selector(_track5Selected:)];
		CCMenuItem *track6 = [CCMenuItemFont itemFromString:@"night (beatless version)" target:self selector:@selector(_track6Selected:)];
		
		track1.anchorPoint = ccp(0,0);
		track1.position = ccp(30,350);
		track2.anchorPoint = ccp(0,0);
		track2.position = ccp(30,300);
		track3.anchorPoint = ccp(0,0);
		track3.position = ccp(30,250);
		track4.anchorPoint = ccp(0,0);
		track4.position = ccp(30,200);
		track5.anchorPoint = ccp(0,0);
		track5.position = ccp(30,150);
		track6.anchorPoint = ccp(0,0);
		track6.position = ccp(30,100);
		
		self.trackMenu = [CCMenu menuWithItems:track1, track2, track3, track4, track5, track6, nil];
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
	self.circleLayer = nil;
	self.trackMenu = nil;
	
	[super dealloc];
}

@end
