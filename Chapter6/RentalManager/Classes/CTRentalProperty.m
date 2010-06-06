//
//  CTRentalProperty.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright 2010 ChrisTec Limited. All rights reserved.
//

#import "CTRentalProperty.h"


@implementation CTRentalProperty

@synthesize leaseDetails, address, propertyType;

+ (id) rentalPropertyOfType:(PropertyType)newPropertyType
				  withLease:(CTLease *)newLease
                  atAddress:(NSString *)newAddress
{
	id newObject = [[CTRentalProperty alloc]initWithAddress:newAddress
												  withLease:newLease
													andType:newPropertyType];
	return [newObject autorelease];
}

- (id) initWithAddress:(NSString *)newAddress
			 withLease:(CTLease *)newLease
               andType:(PropertyType)newPropertyType
{
	if (self = [super init]) {
		self.address = newAddress;
		self.leaseDetails = newLease;
		self.propertyType = newPropertyType;
	}
	
	return self;
}

- (void) dealloc {
	[leaseDetails release];
	[address release];
	[super dealloc];
}

@end
