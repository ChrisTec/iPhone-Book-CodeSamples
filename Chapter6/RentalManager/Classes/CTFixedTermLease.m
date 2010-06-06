//
//  CTFixedTermLease.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTFixedTermLease.h"


@implementation CTFixedTermLease

@synthesize totalRental, numberOfWeeks;

+ (CTLease *) fixedTermLeaseWithPrice:(float) totalRental ForWeeks:(int) numberOfWeeks
{
	CTFixedTermLease * lease = [CTFixedTermLease alloc];
	lease.totalRental = totalRental;
	lease.numberOfWeeks = numberOfWeeks;
	return [lease autorelease];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"$%0.2f for %d weeks", self.totalRental, self.numberOfWeeks];
}


@end
