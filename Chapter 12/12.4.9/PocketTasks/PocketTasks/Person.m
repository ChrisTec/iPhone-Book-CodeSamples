//
//  Person.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright (c) 2011 Springenwerk. All rights reserved.
//

#import "Person.h"
#import "Task.h"


@implementation Person
@dynamic firstName;
@dynamic lastName;
@dynamic tasks;

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
