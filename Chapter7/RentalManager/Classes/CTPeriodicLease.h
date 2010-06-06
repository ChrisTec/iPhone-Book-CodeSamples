//
//  CTPeriodicLease.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTLease.h"

// A rental for a fixed weekly price that is renewed in fixed time intervals
@interface CTPeriodicLease : CTLease {
	float weeklyRental;
}

@property(nonatomic) float weeklyRental;

+ (CTLease *) periodicLeaseWithWeeklyPrice:(float) weeklyPrice;

@end
