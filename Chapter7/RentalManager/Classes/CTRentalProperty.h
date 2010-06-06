//
//  CTRentalProperty.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright 2010 ChrisTec Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTLease.h"

typedef enum PropertyType {
	TownHouse, Unit, Mansion
} PropertyType;

@interface CTRentalProperty : NSObject {
	CTLease *leaseDetails;
	NSString *address;
	PropertyType propertyType;
}

+ (id) rentalPropertyOfType:(PropertyType)newPropertyType
                  withLease:(CTLease *)newLease
                  atAddress:(NSString *)newAddress;

- (id) initWithAddress:(NSString *)newAddress
             withLease:(CTLease *)newLease
               andType:(PropertyType)newPropertyType;

@property(nonatomic, retain) CTLease * leaseDetails;
@property(nonatomic, copy) NSString * address;
@property(nonatomic) PropertyType propertyType;

@end
