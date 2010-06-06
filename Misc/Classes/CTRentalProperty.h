//
//  CTRentalProperty.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

typedef enum PropertyType {
	TownHouse, Unit, Mansion
} PropertyType;

@interface CTRentalProperty : NSObject {
	float rentalPrice;
	NSString * address;
	PropertyType propertyType;
	NSArray * tenants;
}

+ (id) rentalPropertyWithAddress:(NSString *)newAddress 
					 rentalPrice:(float)newRentalPrice
						 andType:(PropertyType)newPropertyType;

- (id) initWithAddress:(NSString *)newAddress 
		   rentalPrice:(float)newRentalPrice
			   andType:(PropertyType)newPropertyType;

- (void) increaseRentalByPercent:(float)percent withMaximum:(float)max;
- (void) decreaseRentalByPercent:(float)percent withMinimum:(float)min;

@property (nonatomic) float rentalPrice;
@property (nonatomic, copy) NSString * address;
@property (nonatomic) PropertyType propertyType;
@property (nonatomic, retain) NSArray * tenants;

@end
