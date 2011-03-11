//
//  CHUnit.m
//  ChaiCraft
//
//  Created by Ben Scheirman on 2/24/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "CHUnit.h"


@implementation CHUnit

@synthesize name, description, canAttackGround, canAttackAir, stealthed, detector;

- (void)dealloc {
	self.name = nil;
	self.description = nil;
	
	[super dealloc];
}

@end
