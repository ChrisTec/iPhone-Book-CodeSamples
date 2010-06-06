//
//  CTRentalProperty.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import "CTRentalProperty.h"

@implementation CTRentalProperty

@synthesize rentalPrice, address, propertyType, tenants;

+ (id) rentalPropertyWithAddress:(NSString *)newAddress
					 rentalPrice:(float)newRentalPrice
						 andType:(PropertyType)newPropertyType
{
	id newObject = [[CTRentalProperty alloc] initWithAddress:newAddress
												 rentalPrice:newRentalPrice
													 andType:newPropertyType];
	
	return [newObject autorelease];
}

- (id) initWithAddress:(NSString *)newAddress
		   rentalPrice:(float)newRentalPrice
			   andType:(PropertyType)newPropertyType
{
	if (self = [super init]) {
		self.address = newAddress;
		self.rentalPrice = newRentalPrice;
		self.propertyType = newPropertyType;
	}
	
	return self;
}

- (void) increaseRentalByPercent:(float)percent withMaximum:(float)max
{
	rentalPrice = rentalPrice * (100 + percent) / 100;
	rentalPrice = fmin(rentalPrice, max);
}

- (void) decreaseRentalByPercent:(float)percent withMinimum:(float)min
{
	rentalPrice = rentalPrice * (100 - percent) / 100;
	rentalPrice = fmax(rentalPrice, min);
}

- (void) dealloc {
	[address release];
	[tenants release];
	
	[super dealloc];
}

@end
