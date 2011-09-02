//
//  RentalManagerAPIViewController.m
//  RentalManagerAPI
//
//  Created by Johannes Fahrenkrug on 26.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import "RentalManagerAPIViewController.h"
#import "RentalManagerAPI.h"

@implementation RentalManagerAPIViewController

- (IBAction)publishAd:(id)sender {
	NSArray *keys = [NSArray arrayWithObjects:@"name", @"city", @"price", nil];
	NSArray *values = [NSArray arrayWithObjects:nameTextField.text, 
					   cityTextField.text,
					   priceTextField.text, nil];
	NSDictionary *ad = [NSDictionary dictionaryWithObjects:values forKeys:keys];
	
	NSError *error;
	
	if ([RentalManagerAPI publishAd:ad error:&error]) {
		UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Success"
													 message:@"Ad published successfully." delegate:nil
										   cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[av show];
		[av release];
	} else {
		NSString *message = nil;
		if ([error domain] == RMAErrorDomain) {
			switch ([error code]) {
				case RMAValidationError:
					message = [NSString stringWithFormat:@"%@\nMissing values: %@.",
							   [error localizedDescription],
							   [[[error userInfo] objectForKey:RMAMissingValuesKey] componentsJoinedByString:@", "]];
					break;
				case RMAWrongCredentialsError:
					// do something else...
					break;
				default:
					message = [error localizedDescription];
					break;
			}
		} else {
			// some other error...
			message = [error localizedDescription];
		}

		
		UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error"
													 message:message delegate:nil
										   cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[av show];
		[av release];
	}
}


- (void)dealloc {
    [super dealloc];
}

@end
