    //
//  MainViewController.m
//  RevolveOST
//
//  Created by Johan Halin on 01.12.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated 
{	
	for (UIView *view in self.view.subviews) 
	{
		if ([view isKindOfClass:[EAGLView class]]) 
		{
			glView = (EAGLView *) view;
			break;
		}
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
			interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	CGRect rect;
	if(toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) 
	{
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
			rect = CGRectMake(0, 0, 768, 1024);
		else
			rect = CGRectMake(0, 0, 320, 480 );
	} 
	else if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) 
	{
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
			rect = CGRectMake(0, 0, 1024, 768);
		else
			rect = CGRectMake(0, 0, 480, 320 );
	}
	
	glView.frame = rect;
}

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
	
	glView = nil;
}

- (void)dealloc 
{
    [super dealloc];
}

@end
