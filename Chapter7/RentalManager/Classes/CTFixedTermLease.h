//
//  CTFixedTermLease.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTLease.h"

// A rental for a fixed number of weeks at a given price
@interface CTFixedTermLease : CTLease {
	float totalRental;
	int numberOfWeeks;
}

@property(nonatomic) float totalRental;
@property(nonatomic) int numberOfWeeks;

+ (CTLease *) fixedTermLeaseWithPrice:(float) totalRental ForWeeks:(int) numberOfWeeks;

@end
