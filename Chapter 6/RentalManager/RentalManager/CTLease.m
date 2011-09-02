//
//  CTLease.m
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CTLease.h"
#import "CTPeriodicLease.h"
#import "CTFixedLease.h"

@implementation CTLease

+ (CTLease *)periodicLease:(float)weeklyPrice
{
    CTLease *lease = [CTPeriodicLease periodicLeaseWithWeeklyPrice:weeklyPrice];
    return [lease autorelease];
}

+ (CTLease *)fixedTermLeaseWithPrice:(float)totalRental forWeeks:(int)numberOfWeeks
{
    CTLease *lease = [CTFixedLease fixedTermLeaseWithPrice:totalRental forWeeks:numberOfWeeks];
    return [lease autorelease];
}

@end
