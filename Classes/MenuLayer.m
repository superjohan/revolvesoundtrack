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
@property (nonatomic, retain) CCSprite *playing1;
@property (nonatomic, retain) CCSprite *playing2;
@property (nonatomic, retain) CCSprite *playing3;
@property (nonatomic, retain) CCLabel *menuTip;
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
@synthesize playing1;
@synthesize playing2;
@synthesize playing3;
@synthesize menuTip;

const NSInteger kActionDuration = 2;
const CGFloat kShortActionDuration = .1f;

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
	[self.trackMenu runAction:[CCTintTo actionWithDuration:kActionDuration red:10 green:32 blue:65]];
}

- (void)_showColorScheme3
{
	[self.menu1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self.menu3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];	
	[self.circles showBackground3];
	[self.trackMenu runAction:[CCTintTo actionWithDuration:kActionDuration red:190 green:212 blue:245]];
}

- (void)_changeNowPlayingToTrackNumber:(NSInteger)track
{
	[self.playing1 runAction:[CCMoveTo actionWithDuration:kShortActionDuration position:ccp(self.playing1.position.x, 363 - (50 * (track - 1)))]];
	[self.playing2 runAction:[CCMoveTo actionWithDuration:kShortActionDuration position:ccp(self.playing2.position.x, 363 - (50 * (track - 1)))]];
	[self.playing3 runAction:[CCMoveTo actionWithDuration:kShortActionDuration position:ccp(self.playing3.position.x, 363 - (50 * (track - 1)))]];
	
	if(track ==1)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	}
	else if(track == 2 || track == 5)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	}
	else if(track == 3 || track == 4 || track == 6)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
	}
}

- (void)_toggleNowPlaying
{
	NSInteger opacityVisible = 0;
	NSInteger opacityHidden = 0;
	
	if(self.menuVisible)
	{
		opacityVisible = 255;
	}
	else 
	{
		opacityVisible = 0;
	}

	if(self.trackPlaying ==1)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityVisible]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
	}
	else if(self.trackPlaying == 2 || self.trackPlaying == 5)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityVisible]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
	}
	else if(self.trackPlaying == 3 || self.trackPlaying == 4 || self.trackPlaying == 6)
	{
		[self.playing1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
		[self.playing2 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityHidden]];
		[self.playing3 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:opacityVisible]];
	}	
}

- (void)_track1Selected:(id)sender
{
	if(self.trackPlaying != 1)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"01.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"01.m4a" loop:YES];

		[self _showColorScheme1];
		[self _changeNowPlayingToTrackNumber:1];
		self.trackPlaying = 1;
	}
}

- (void)_track2Selected:(id)sender
{
	if(self.trackPlaying != 2)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"02.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"02.m4a" loop:YES];
		
		[self _showColorScheme2];
		[self _changeNowPlayingToTrackNumber:2];
		self.trackPlaying = 2;
	}
}

- (void)_track3Selected:(id)sender
{
	if(self.trackPlaying != 3)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"03.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"03.m4a" loop:YES];
		
		[self _showColorScheme3];
		[self _changeNowPlayingToTrackNumber:3];
		self.trackPlaying = 3;
	}
}

- (void)_track4Selected:(id)sender
{
	if(self.trackPlaying != 4)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"04.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"04.m4a" loop:YES];
		
		[self _showColorScheme3];
		[self _changeNowPlayingToTrackNumber:4];
		self.trackPlaying = 4;
	}
}

- (void)_track5Selected:(id)sender
{
	if(self.trackPlaying != 5)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"05.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"05.m4a" loop:YES];
		
		[self _showColorScheme2];
		[self _changeNowPlayingToTrackNumber:5];
		self.trackPlaying = 5;
	}
}

- (void)_track6Selected:(id)sender
{
	if(self.trackPlaying != 6)
	{
		[[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
		[[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"06.m4a"];
		[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"06.m4a" loop:YES];
		
		[self _showColorScheme3];
		[self _changeNowPlayingToTrackNumber:6];
		self.trackPlaying = 6;
	}
}

- (void)_toggleMenu:(id)sender
{
	if(self.menuVisible)
	{
		[self.trackMenu runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
		self.menuVisible = NO;
	}
	else 
	{
		[self.trackMenu runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
		self.menuVisible = YES;
	}
	
	[self _toggleNowPlaying];
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
	self.track1.position = ccp(40,350);
	self.track2.anchorPoint = ccp(0,0);
	self.track2.position = ccp(40,300);
	self.track3.anchorPoint = ccp(0,0);
	self.track3.position = ccp(40,250);
	self.track4.anchorPoint = ccp(0,0);
	self.track4.position = ccp(40,200);
	self.track5.anchorPoint = ccp(0,0);
	self.track5.position = ccp(40,150);
	self.track6.anchorPoint = ccp(0,0);
	self.track6.position = ccp(40,100);
	
	self.trackMenu = [CCMenu menuWithItems:self.track1, self.track2, self.track3, self.track4, self.track5, self.track6, nil];
	[self.trackMenu setColor:ccc3(64,43,10)];
	self.trackMenu.position = CGPointZero;
	[self.trackMenu setOpacity:0];
	[self addChild:self.trackMenu z:5];
	[self.trackMenu setColor:ccc3(64,43,10)];
}

- (void)_configureMenuButton
{
	CCSprite *menuButtonSprite1 = [CCSprite spriteWithFile:@"menu.png"];
	CCMenuItem *menuButton1 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite1 selectedSprite:menuButtonSprite1 target:self selector:@selector(_toggleMenu:)];
	menuButton1.position = ccp(40, 30);
	menuButton1.anchorPoint = ccp(0,0);
	self.menu1 = [CCMenu menuWithItems:menuButton1, nil];
	self.menu1.position = CGPointZero;
	[self.menu1 setOpacity:0];
	[self addChild:self.menu1 z:5];
	
	CCSprite *menuButtonSprite2 = [CCSprite spriteWithFile:@"menu-2.png"];
	CCMenuItem *menuButton2 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite2 selectedSprite:menuButtonSprite2 target:self selector:@selector(_toggleMenu:)];
	menuButton2.position = ccp(40, 30);
	menuButton2.anchorPoint = ccp(0,0);
	self.menu2 = [CCMenu menuWithItems:menuButton2, nil];
	self.menu2.position = CGPointZero;
	[self.menu2 setOpacity:0];
	[self addChild:self.menu2 z:5];
	
	CCSprite *menuButtonSprite3 = [CCSprite spriteWithFile:@"menu-3.png"];
	CCMenuItem *menuButton3 = [CCMenuItemSprite itemFromNormalSprite:menuButtonSprite3 selectedSprite:menuButtonSprite3 target:self selector:@selector(_toggleMenu:)];
	menuButton3.position = ccp(40, 30);
	menuButton3.anchorPoint = ccp(0,0);
	self.menu3 = [CCMenu menuWithItems:menuButton3, nil];
	self.menu3.position = CGPointZero;
	[self.menu3 setOpacity:0];
	[self addChild:self.menu3 z:5];
	
	self.menuTip = [CCLabel labelWithString:@"menu" fontName:@"MonkeyLove" fontSize:48];
	self.menuTip.position = ccp(160, 52);
	self.menuTip.color = ccc3(64,43,10);
	self.menuTip.opacity = 0;
	[self addChild:self.menuTip z:5];
}

- (void)_configureNowPlaying
{
	self.playing1 = [CCSprite spriteWithFile:@"menu.png"];
	self.playing1.scale = .5f;
	self.playing1.position = ccp(10,363);
	self.playing1.anchorPoint = ccp(0,0);
	self.playing1.opacity = 0;
	[self addChild:self.playing1 z:5];
	
	self.playing2 = [CCSprite spriteWithFile:@"menu-2.png"];
	self.playing2.scale = .5f;
	self.playing2.position = ccp(10,363);
	self.playing2.anchorPoint = ccp(0,0);
	self.playing2.opacity = 0;
	[self addChild:self.playing2 z:5];

	self.playing3 = [CCSprite spriteWithFile:@"menu-3.png"];
	self.playing3.scale = .5f;
	self.playing3.position = ccp(10,363);
	self.playing3.anchorPoint = ccp(0,0);
	self.playing3.opacity = 0;
	[self addChild:self.playing3 z:5];	
}

- (void)_hideMenuTip
{
	[self.menuTip runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:0]];
	[self unschedule:@selector(_hideMenuTip)];
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
		[self _configureNowPlaying];
		
		[self.menu1 runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
		[self.menuTip runAction:[CCFadeTo actionWithDuration:kActionDuration opacity:255]];
		[self schedule:@selector(_hideMenuTip) interval:5];
		self.menuVisible = NO;
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
	self.playing1 = nil;
	self.playing2 = nil;
	self.playing3 = nil;
	self.menuTip = nil;
	
	[super dealloc];
}

@end
