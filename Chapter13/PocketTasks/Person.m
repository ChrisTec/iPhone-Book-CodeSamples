// 
//  Person.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 12.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person 

@dynamic firstName;
@dynamic lastName;
@dynamic tasks;

- (NSString *)fullName {
	return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
