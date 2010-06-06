//
//  CTPeriodicLease.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTPeriodicLease.h"

@implementation CTPeriodicLease

@synthesize weeklyRental;

+ (CTLease *) periodicLeaseWithWeeklyPrice:(float) weeklyPrice
{
	CTPeriodicLease * lease = [CTPeriodicLease alloc];
	lease.weeklyRental = weeklyPrice;
	return [lease autorelease];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"$%0.2f per week", self.weeklyRental];
}

@end
