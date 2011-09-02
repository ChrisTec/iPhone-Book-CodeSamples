//
//  CTFixedLease.h
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTLease.h"

@interface CTFixedLease : CTLease {
    float totalRental;
    int numberOfWeeks;
}

@property(nonatomic) float totalRental;
@property(nonatomic) int numberOfWeeks;

+ (CTLease *)fixedTermLeaseWithPrice:(float)totalRental forWeeks:(int)numberOfWeeks;

@end
