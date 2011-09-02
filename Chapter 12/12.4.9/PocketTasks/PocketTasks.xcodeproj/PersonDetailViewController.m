//
//  PersonDetailViewController.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import "PersonDetailViewController.h"


@implementation PersonDetailViewController

- (void)saveAndDismiss {
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
	} else  {
		[person setValue:[firstNameTextField text] forKey:@"firstName"];
		[person setValue:[lastNameTextField text] forKey:@"lastName"];
		
		NSError *error = nil;
		if (![managedObjectContext save:&error]) {
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		} else {
			[self dismissModalViewControllerAnimated:YES];
		}	
	}
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
    if ((self = [super initWithNibName:@"PersonDetailViewController" bundle:nil])) {
        managedObjectContext = [moc retain];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [managedObjectContext release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
