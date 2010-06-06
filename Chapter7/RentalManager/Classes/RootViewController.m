//
//  RootViewController.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright ChrisTec Limited 2010. All rights reserved.
//

#import "RootViewController.h"
#import "CTRentalProperty.h"

#import "RentalPropertyCell.h"
#import "ImportantRentalPropertyCell.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	NSString * path = [[NSBundle mainBundle] pathForResource:@"CityMappings" ofType:@"plist"];	
	cityMappings = [[NSDictionary alloc] initWithContentsOfFile:path];

	properties = [[NSArray alloc] initWithObjects:                          
				  [CTRentalProperty rentalPropertyOfType:TownHouse                      
											   withLease:[CTLease periodicLease:420.0f]                         
											   atAddress:@"13 Waverly Crescent, Sumner"],       
				  [CTRentalProperty rentalPropertyOfType:Unit                           
											   withLease:[CTLease periodicLease:365.0f]                        
											   atAddress:@"74 Roberson Lane, Christchurch"],          
				  [CTRentalProperty rentalPropertyOfType:Unit                           
											   withLease:[CTLease periodicLease:275.9f]                         
											   atAddress:@"17 Kipling Street, Riccarton"],         
				  [CTRentalProperty rentalPropertyOfType:Mansion                        
											   withLease:[CTLease fixedTermLeaseWithPrice:78000.0f ForWeeks:52]                        
											   atAddress:@"4 Everglade Ridge, Sumner"],         
				  [CTRentalProperty rentalPropertyOfType:Mansion                        
											   withLease:[CTLease fixedTermLeaseWithPrice:40000.0f ForWeeks:20] 
											   atAddress:@"19 Islington Road, Clifton"],         
				  nil];
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [properties count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier_Normal = @"Cell";
	static NSString *CellIdentifier_Important = @"Cell2";

	
	NSString * cellType = (indexPath.row == 2) ? CellIdentifier_Important : CellIdentifier_Normal;
	id<RentalPropertyContext> cell = (id<RentalPropertyContext>)[tableView dequeueReusableCellWithIdentifier:cellType];

	if (cell == nil) {
		if (indexPath.row == 2) {
			cell = [[[ImportantRentalPropertyCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:CellIdentifier_Important] autorelease];
		}
		else {
			cell = [[[RentalPropertyCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:CellIdentifier_Normal] autorelease];
		}	
	}
	
	// Configure the cell.
	CTRentalProperty * property = [properties objectAtIndex:indexPath.row];
	[cell setProperty:property];
	
	return (UITableViewCell *)cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

	return 80;
}

- (void)dealloc {
	[cityMappings release];
	[properties release];
	
    [super dealloc];
}

@end

