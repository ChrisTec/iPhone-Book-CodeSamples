//
//  CTLease.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTLease.h"

#import "CTPeriodicLease.h"
#import "CTFixedTermLease.h"

@implementation CTLease

+ (CTLease *) periodicLease:(float) weeklyPrice
{
	CTLease * lease = [CTPeriodicLease periodicLeaseWithWeeklyPrice:weeklyPrice];
	return [lease autorelease];
}

+ (CTLease *) fixedTermLeaseWithPrice:(float) totalRental ForWeeks:(int) numberOfWeeks
{
	CTLease * lease = [CTFixedTermLease fixedTermLeaseWithPrice:totalRental ForWeeks:numberOfWeeks];
	return [lease autorelease];
}

@end
