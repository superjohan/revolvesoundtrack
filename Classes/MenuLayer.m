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
@property (nonatomic, retain) CCMenu *menu1;
@property (nonatomic, retain) CCMenu *menu2;
@property (nonatomic, retain) CCMenu *menu3;
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
@synthesize menu1;
@synthesize menu2;
@synthesize menu3;

const NSInteger kActionDuration = 1;

#pragma mark Private

- (void)_showColorScheme1
{
	[self.menu1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
	[self.menu2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];	
	[self.circles showBackground1];
	[self.trackMenu runAction:[CCTintTo actionWithDuration:kActionDuration red:64 green:43 blue:10]];
}

- (void)_showColorScheme2
{
	[self.menu1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
	[self.menu3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];	
	[self.circles showBackground2];
	[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:10 green:32 blue:65]];
}

- (void)_showColorScheme3
{
	[self.menu1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];	
	[self.circles showBackground3];
	[self.trackMenu runAction:[CCTintTo actionWithDuration:1 red:190 green:212 blue:245]];
}

- (void)_track1Selected:(id)sender
{
	if(self.trackPlaying != 1)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"01.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"01.m4a" loop:YES];
		
		[self _showColorScheme1];
		self.trackPlaying = 1;
	}
}

- (void)_track2Selected:(id)sender
{
	if(self.trackPlaying != 2)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"02.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"02.m4a" loop:YES];
		
		[self _showColorScheme2];
		self.trackPlaying = 2;
	}
}

- (void)_track3Selected:(id)sender
{
	if(self.trackPlaying != 3)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"03.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"03.m4a" loop:YES];
		
		[self _showColorScheme3];
		self.trackPlaying = 3;
	}
}

- (void)_track4Selected:(id)sender
{
	if(self.trackPlaying != 4)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"04.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"04.m4a" loop:YES];
		
		[self _showColorScheme3];
		self.trackPlaying = 4;
	}
}

- (void)_track5Selected:(id)sender
{
	if(self.trackPlaying != 5)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"05.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"05.m4a" loop:YES];
		
		[self _showColorScheme2];
		self.trackPlaying = 5;
	}
}

- (void)_track6Selected:(id)sender
{
	if(self.trackPlaying != 6)
	{
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"06.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"06.m4a" loop:YES];
		
		[self _showColorScheme3];
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

- (void)_configureMenu
{
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
}

- (void)_configureMenuButton
{
	CCSprite *menuButtonSprite1 = [CCSprite spriteWithFile:@"menu.png"];
	CCMenuItem *menuButton1 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite1 selectedSprite:menuButtonSprite1 target:self selector:@selector(_toggleMenu:)];
	menuButton1.position = ccp(30, 30);
	menuButton1.anchorPoint = ccp(0,0);
	self.menu1 = [CCMenu menuWithItems:menuButton1, nil];
	self.menu1.position = CGPointZero;
	self.menu1.opacity = 255;
	[self addChild:self.menu1 z:5];
	
	CCSprite *menuButtonSprite2 = [CCSprite spriteWithFile:@"menu-2.png"];
	CCMenuItem *menuButton2 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite2 selectedSprite:menuButtonSprite2 target:self selector:@selector(_toggleMenu:)];
	menuButton2.position = ccp(30, 30);
	menuButton2.anchorPoint = ccp(0,0);
	self.menu2 = [CCMenu menuWithItems:menuButton2, nil];
	self.menu2.position = CGPointZero;
	self.menu2.opacity = 0;
	[self addChild:self.menu2 z:5];
	
	CCSprite *menuButtonSprite3 = [CCSprite spriteWithFile:@"menu-3.png"];
	CCMenuItem *menuButton3 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite3 selectedSprite:menuButtonSprite3 target:self selector:@selector(_toggleMenu:)];
	menuButton3.position = ccp(30, 30);
	menuButton3.anchorPoint = ccp(0,0);
	self.menu3 = [CCMenu menuWithItems:menuButton3, nil];
	self.menu3.position = CGPointZero;
	self.menu3.opacity = 0;
	[self addChild:self.menu3 z:5];
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
		
		[self _configureMenu];
		[self _configureMenuButton];
		
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
	self.menu1 = nil;
	self.menu2 = nil;
	self.menu3 = nil;
	
	[super dealloc];
}

@end
