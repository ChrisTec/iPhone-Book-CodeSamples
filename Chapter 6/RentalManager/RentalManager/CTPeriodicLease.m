//
//  CTPeriodicLease.m
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CTPeriodicLease.h"


@implementation CTPeriodicLease

@synthesize weeklyRental;

+ (CTLease *)periodicLeaseWithWeeklyPrice:(float)weeklyPrice
{
    CTPeriodicLease *lease = [CTPeriodicLease alloc];
    lease.weeklyRental = weeklyPrice;
    return [lease autorelease];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"$%0.2f per week", self.weeklyRental];
}

@end
