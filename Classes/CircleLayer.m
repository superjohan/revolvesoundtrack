//
//  CircleLayer.m
//  RevolveOST
//
//  Created by Johan Halin on 18.11.2010.
//  Copyright 2010 Parasol. All rights reserved.
//

#import "CircleLayer.h"

@implementation CircleLayer

-(id)init
{	
	self = [super init];
	
	if(self != nil)
	{
		self.isTouchEnabled = NO;
	}
	
	return self;
}

@end
