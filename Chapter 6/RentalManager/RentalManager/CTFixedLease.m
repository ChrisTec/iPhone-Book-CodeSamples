//
//  CTFixedLease.m
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CTFixedLease.h"


@implementation CTFixedLease

@synthesize totalRental, numberOfWeeks;

+ (CTLease *)fixedTermLeaseWithPrice:(float)totalRental forWeeks:(int)numberOfWeeks
{
    CTFixedLease *lease = [CTFixedLease alloc];
    lease.totalRental = totalRental;
    lease.numberOfWeeks = numberOfWeeks;
    return [lease autorelease];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"$%0.2f for %d weeks", self.totalRental, self.numberOfWeeks];
}

@end
