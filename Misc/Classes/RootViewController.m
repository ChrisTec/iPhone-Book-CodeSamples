//
//  RootViewController.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright ChrisTec 2010. All rights reserved.
//

#import "RootViewController.h"
#import "CTRentalProperty.h"
#import "CTPerson.h"

static const struct {
	NSString * title;
	NSString * expression;
} filterPredicates[] = {
	{ @"All",							@"TRUEPREDICATE" },
	{ @"Less than $300pw",				@"rentalPrice < 300.0" },
	{ @"Townhouses",					@"propertyType = 1" },
	{ @"With small children",			@"ANY tenants.age < 5" },
	{ @"Small children + large rent",	@"ANY tenants.age < 5 AND rentalPrice > 500.0" },
	{ @"All occuptants under 30",		@"ALL tenants.age < 30" }
};

static const int numberOfFilterPredicates = sizeof(filterPredicates) / sizeof(filterPredicates[0]);

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// TODO: Perhaps this could be expanded to fetch this data from an XML file hosted on the internet
	//       or from a Core Data data store etc?
	// TODO: Could the chapter on subclassing etc introduce subclasses to the CTRentalProperty class?
	//       however what different messages / properties would the subclasses practically expose?
	CTRentalProperty * property1 = [CTRentalProperty rentalPropertyWithAddress:@"13 Adamson Crescent" rentalPrice:275.0 andType:TownHouse];
	property1.tenants = [NSArray arrayWithObjects:
						  [CTPerson personWithName:@"Kim Preston" andAge:32],
						  [CTPerson personWithName:@"Kelly Preston" andAge:29],
						  nil];	
	
	CTRentalProperty * property2 = [CTRentalProperty rentalPropertyWithAddress:@"74 Hansons Lane" rentalPrice:365.0 andType:Unit];
	property2.tenants = [NSArray arrayWithObjects:
						  [CTPerson personWithName:@"Jane Doe" andAge:26],
						  [CTPerson personWithName:@"Preston Doe" andAge:1],
						  nil];
		
	CTRentalProperty * property3 = [CTRentalProperty rentalPropertyWithAddress:@"49 Some Drive" rentalPrice:4650.0 andType:Mansion];
	property3.tenants = [NSArray arrayWithObjects:
						  [CTPerson personWithName:@"Bob Jones" andAge:47],
						  [CTPerson personWithName:@"Janet Jones" andAge:45],
						  [CTPerson personWithName:@"Ben Jones" andAge:3],
						  nil];
	
	allRentalProperties = [[NSArray alloc] initWithObjects:
						   property1,
						   property2,
						   property3,
						   nil];
	
	filteredRentalProperties = [allRentalProperties copy];
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [filteredRentalProperties count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell
	CTRentalProperty * property = [filteredRentalProperties objectAtIndex:indexPath.row];

	// TODO: Is this the best example of the power of key value coding? probably not...
	//       as [property.tenants count] works just as easily and has better compile
	//       time error checking vs this "magic string". How about something
	//       like "tenants.@max.age" instead? This is still easy to manually code
	//       but atleast its starting to demonstrate the declarative nature of KVC.
	int tenantCount = [[property valueForKeyPath:@"tenants.@count"] intValue];
	
	cell.textLabel.text = property.address;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Rents for $%0.02f per week (%d people)", property.rentalPrice, tenantCount];

    return cell;
}

- (IBAction) selectFilter {
	UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"Select filter"
														delegate:self
											   cancelButtonTitle:nil
										  destructiveButtonTitle:nil
											   otherButtonTitles:nil];
	
	for (int i = 0; i < numberOfFilterPredicates; i++) {
		[sheet addButtonWithTitle:filterPredicates[i].title];
	}
	
	sheet.cancelButtonIndex = [sheet addButtonWithTitle:@"Cancel"];
	
	[sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	// If user didn't select cancel button
	if (buttonIndex < numberOfFilterPredicates)
	{
		// Filter the list of rental properties by the selected predicate
		// expression and reload the table view with the results
	
		NSString * predicateExpression = filterPredicates[buttonIndex].expression;
		
		NSPredicate * predicate = [NSPredicate predicateWithFormat:predicateExpression];

		[filteredRentalProperties release];
		filteredRentalProperties = [[allRentalProperties filteredArrayUsingPredicate:predicate] retain];
	
		[self.tableView reloadData];
	}
}

- (void)dealloc {
	[filteredRentalProperties release];
	[allRentalProperties release];
	
    [super dealloc];
}

@end

