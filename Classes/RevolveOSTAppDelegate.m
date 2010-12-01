//
//  RevolveOSTAppDelegate.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright Parasol 2010. All rights reserved.
//

#import "RevolveOSTAppDelegate.h"
#import "cocos2d.h"
#import "PlayerScene.h"

@implementation RevolveOSTAppDelegate

@synthesize window;
@synthesize viewController;

- (void) applicationDidFinishLaunching:(UIApplication*)application
{
	// CC_DIRECTOR_INIT()
	//
	// 1. Initializes an EAGLView with 0-bit depth format, and RGB565 render buffer
	// 2. EAGLView multiple touches: disabled
	// 3. creates a UIWindow, and assign it to the "window" var (it must already be declared)
	// 4. Parents EAGLView to the newly created window
	// 5. Creates Display Link Director
	// 5a. If it fails, it will use an NSTimer director
	// 6. It will try to run at 60 FPS
	// 7. Display FPS: NO
	// 8. Device orientation: Portrait
	// 9. Connects the director to the EAGLView
	//
	CC_DIRECTOR_INIT();
	
	// Obtain the shared director in order to...
	CCDirector *director = [CCDirector sharedDirector];
	
	viewController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
	viewController.wantsFullScreenLayout = YES;
	
	// Create the EAGLView manually
	EAGLView *view = [EAGLView viewWithFrame:[window bounds]
								 pixelFormat:kEAGLColorFormatRGBA8
								 depthFormat:GL_DEPTH_COMPONENT24_OES
						  preserveBackbuffer:NO];

	[director setOpenGLView:view];
	
	// Sets landscape mode
	[director setDeviceOrientation:kCCDeviceOrientationPortrait];
	
	// Turn on display FPS
	[director setDisplayFPS:NO];
	
	// Turn on multiple touches
	//EAGLView *view = [director openGLView];
	[view setMultipleTouchEnabled:YES];
	
	// make the OpenGLView a child of the view controller
	[viewController.view addSubview:view];
	
	// make the View Controller a child of the main window
	[window addSubview: viewController.view];
	
	[window makeKeyAndVisible];

	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];	
	
	[[CCDirector sharedDirector] runWithScene: [PlayerScene scene]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	[[CCDirector sharedDirector] pause];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[[CCDirector sharedDirector] resume];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[CCDirector sharedDirector] purgeCachedData];
}

-(void) applicationDidEnterBackground:(UIApplication*)application {
	[[CCDirector sharedDirector] stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application {
	[[CCDirector sharedDirector] startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[CCDirector sharedDirector] end];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc {
	[[CCDirector sharedDirector] release];
	[window release];
	[super dealloc];
}

@end
