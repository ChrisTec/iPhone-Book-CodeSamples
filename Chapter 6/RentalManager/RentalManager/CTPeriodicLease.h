//
//  CTPeriodicLease.h
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTLease.h"

@interface CTPeriodicLease : CTLease {
    float weeklyRental;
}

@property(nonatomic) float weeklyRental;

+ (CTLease *)periodicLeaseWithWeeklyPrice:(float)weeklyPrice;

@end
