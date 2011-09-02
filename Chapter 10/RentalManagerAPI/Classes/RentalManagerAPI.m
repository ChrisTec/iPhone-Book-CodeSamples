//
//  RentalManagerAPI.m
//  RentalManagerAPI
//
//  Created by Johannes Fahrenkrug on 26.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import "RentalManagerAPI.h"

NSString * const RMAErrorDomain = @"com.my-awesome-rental-manager.API";
NSString * const RMAMissingValuesKey = @"RMAMissingValuesKey";
NSString * const RMAAccountExpirationDateKey = @"RMAAccountExpirationDateKey";

@implementation RentalManagerAPI

+ (BOOL)publishAd:(NSDictionary *)anAd error:(NSError **)anError {
	// it's a programming error when anAd is ever nil
	if (anAd == nil) {
		@throw [NSException exceptionWithName:@"RentalManagerBadAPICall" 
									   reason:@"anAd dictionary is nil" 
									 userInfo:nil];
	}
	
	//name, price, and city are required values
	NSMutableArray *missingValues = [NSMutableArray array];
	for (NSString *key in [@"name price city" componentsSeparatedByString:@" "]) {
		if ([[anAd objectForKey:key] length] == 0) {
			[missingValues addObject:key];
		}
	}
		
	if ([missingValues count] > 0) {
		if (anError != NULL) {
			NSString *description = @"The ad could not be published because some required values are missing.";
			NSString *recoverySuggestion = @"Please provide the missing values and try again.";
			NSArray *keys = [NSArray arrayWithObjects:NSLocalizedDescriptionKey,
							 NSLocalizedRecoverySuggestionErrorKey,
							 RMAMissingValuesKey, nil];
			NSArray *values = [NSArray arrayWithObjects:description,
							   recoverySuggestion,
							   missingValues, nil];
			NSDictionary *userDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
			
			*anError = [[[NSError alloc] initWithDomain:RMAErrorDomain
												   code:RMAValidationError 
											   userInfo:userDict] autorelease];
		}
		return NO;
	} else {
		// talk to the API and do stuff
		return YES;
	}
}

@end
