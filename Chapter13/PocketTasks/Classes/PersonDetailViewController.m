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
	

	if ([[firstNameTextField text] length] < 1 || [[lastNameTextField text] length] < 1) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" 
														message:@"First and last name can't be empty."
													   delegate:nil 
											  cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
		[alert show];
		[alert release];
	} else {
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
