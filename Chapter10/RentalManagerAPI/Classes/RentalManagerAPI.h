//
//  RentalManagerAPI.h
//  RentalManagerAPI
//
//  Created by Johannes Fahrenkrug on 26.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import <Foundation/Foundation.h>

// custom userInfo dictionary keys
extern NSString * const RMAMissingValuesKey;
extern NSString * const RMAAccountExpirationDateKey;

// custom error domain
extern NSString * const RMAErrorDomain;

// custom error codes
enum {
    RMAValidationError = 1,      // required value missing
    RMAAccountExpiredError = 2,  // user's account expired
	RMAWrongCredentialsError = 3 // wrong user/password
};

@interface RentalManagerAPI : NSObject {

}

+ (BOOL)publishAd:(NSDictionary *)anAd error:(NSError **)anError;

@end
