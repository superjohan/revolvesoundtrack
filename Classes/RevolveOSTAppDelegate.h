//
//  RevolveOSTAppDelegate.h
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright Parasol 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface RevolveOSTAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) MainViewController *viewController;

@end
