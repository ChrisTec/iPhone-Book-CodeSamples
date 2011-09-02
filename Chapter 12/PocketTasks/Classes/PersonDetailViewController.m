//
//  PersonDetailViewController.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 10.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PersonDetailViewController.h"


@implementation PersonDetailViewController

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
	if (self = [super initWithNibName:@"PersonDetailView" bundle:nil]) {
		managedObjectContext = [moc retain];
	}
	
	return self;
}

- (void)saveAndDismiss {
	// Create a new instance of the Person entity
	if (!person) {
		person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" 
											   inManagedObjectContext:managedObjectContext];
	}
	

	/*
	 It is left as an excercise to you to use the displayValidationError: method below instead of this
	 "manual" validation.
	 Please note that an empty string is regarded as a valid value for a non-optional field.
	 So to catch those validation errors, you'd have to add a minimum length to the attribute 
	 in your data model.
	 */
	if ([[firstNameTextField text] length] < 1 || [[lastNameTextField text] length] < 1) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" 
														message:@"First and last name can't be empty."
													   delegate:nil 
											  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	} else  {
		person.firstName = [firstNameTextField text];
		person.lastName = [lastNameTextField text];
		
		// Save the context.
		NSError *error = nil;
		if (![managedObjectContext save:&error]) {
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		} else {
			[self dismissModalViewControllerAnimated:YES];
		}	
	}
}

- (void)displayValidationError:(NSError *)anError {
	if (anError && [[anError domain] isEqualToString:@"NSCocoaErrorDomain"]) {
		NSArray *errors = nil;
		
		// multiple errors?
		if ([anError code] == NSValidationMultipleErrorsError) {
			errors = [[anError userInfo] objectForKey:NSDetailedErrorsKey];
		} else {
			errors = [NSArray arrayWithObject:anError];
		}
		
		if (errors && [errors count] > 0) {
			NSString *messages = @"Reason(s):\n";
			
			for (NSError * error in errors) {
				NSString *entityName = [[[[error userInfo] objectForKey:@"NSValidationErrorObject"] entity] name];
				NSString *attributeName = [[error userInfo] objectForKey:@"NSValidationErrorKey"];
				NSString *msg;
				switch ([error code]) {
					case NSManagedObjectValidationError:
						msg = @"Generic validation error.";
						break;
					case NSValidationMissingMandatoryPropertyError:
						msg = [NSString stringWithFormat:@"The attribute '%@' mustn't be empty.", attributeName];
						break;
					case NSValidationRelationshipLacksMinimumCountError:  
						msg = [NSString stringWithFormat:@"The relationship '%@' doesn't have enough entries.", attributeName];
						break;
					case NSValidationRelationshipExceedsMaximumCountError:
						msg = [NSString stringWithFormat:@"The relationship '%@' has too many entries.", attributeName];
						break;
					case NSValidationRelationshipDeniedDeleteError:
						msg = [NSString stringWithFormat:@"To delete, the relationship '%@' must be empty.", attributeName];
						break;
					case NSValidationNumberTooLargeError:                 
						msg = [NSString stringWithFormat:@"The number of the attribute '%@' is too large.", attributeName];
						break;
					case NSValidationNumberTooSmallError:                 
						msg = [NSString stringWithFormat:@"The number of the attribute '%@' is too small.", attributeName];
						break;
					case NSValidationDateTooLateError:                    
						msg = [NSString stringWithFormat:@"The date of the attribute '%@' is too late.", attributeName];
						break;
					case NSValidationDateTooSoonError:                    
						msg = [NSString stringWithFormat:@"The date of the attribute '%@' is too soon.", attributeName];
						break;
					case NSValidationInvalidDateError:                    
						msg = [NSString stringWithFormat:@"The date of the attribute '%@' is invalid.", attributeName];
						break;
					case NSValidationStringTooLongError:      
						msg = [NSString stringWithFormat:@"The text of the attribute '%@' is too long.", attributeName];
						break;
					case NSValidationStringTooShortError:                 
						msg = [NSString stringWithFormat:@"The text of the attribute '%@' is too short.", attributeName];
						break;
					case NSValidationStringPatternMatchingError:          
						msg = [NSString stringWithFormat:@"The text of the attribute '%@' doesn't match the required pattern.", attributeName];
						break;
					default:
						msg = [NSString stringWithFormat:@"Unknown error (code %i).", [error code]];
						break;
				}
				
				messages = [messages stringByAppendingFormat:@"%@%@%@\n", (entityName?:@""),(entityName?@": ":@""),msg];
			}
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Validation Error" 
															message:messages
														   delegate:nil 
												  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
			[alert show];
			[alert release];
		}
	}
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[managedObjectContext release];
    [super dealloc];
}


@end
