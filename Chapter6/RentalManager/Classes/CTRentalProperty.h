//
//  CTRentalProperty.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright 2010 ChrisTec Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum PropertyType {
	TownHouse, Unit, Mansion
} PropertyType;

@interface CTRentalProperty : NSObject {
	float rentalPrice;
	NSString *address;
	PropertyType propertyType;
}

+ (id) rentalPropertyOfType:(PropertyType)newPropertyType
                 rentingFor:(float)newRentalPrice
                  atAddress:(NSString *)newAddress;

- (id) initWithAddress:(NSString *)newAddress
           rentalPrice:(float)newRentalPrice
               andType:(PropertyType)newPropertyType;

- (void) increaseRentalByPercent:(float)percent withMaximum:(float)max;
- (void) decreaseRentalByPercent:(float)percent withMinimum:(float)min;

@property(nonatomic) float rentalPrice;
@property(nonatomic, copy) NSString * address;
@property(nonatomic) PropertyType propertyType;

@end
