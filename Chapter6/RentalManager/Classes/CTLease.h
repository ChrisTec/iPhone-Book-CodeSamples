//
//  CTLease.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 7/06/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import <Foundation/Foundation.h>

// See http://en.wikipedia.org/wiki/Lease

@interface CTLease : NSObject {

}

+ (CTLease *) periodicLease:(float) weeklyPrice;
+ (CTLease *) fixedTermLeaseWithPrice:(float) totalRental ForWeeks:(int) numberOfWeeks;

@end
