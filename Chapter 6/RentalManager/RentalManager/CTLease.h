//
//  CTLease.h
//  RentalManager
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTLease : NSObject {
    
}

+ (CTLease *)periodicLease:(float)weeklyPrice;
+ (CTLease *)fixedTermLeaseWithPrice:(float)totalRental forWeeks:(int)numberOfWeeks;

@end
