//
//  CTPerson.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTPerson.h"


@implementation CTPerson

@synthesize name, age;

+ (id) personWithName:(NSString *)newName andAge:(int)newAge {
	return [[[CTPerson alloc] initWithName:newName andAge:newAge] autorelease];
}

- (id) initWithName:(NSString *)newName andAge:(int)newAge {
	if (self = [super init]) {
		self.name = newName;
		self.age = newAge;
	}
	
	return self;
}

- (void) dealloc {
	[name release];
	
	[super dealloc];
}

@end
