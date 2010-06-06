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

	static NSString *CellIdentifier = @"Cell";

	RentalPropertyCell *cell = (RentalPropertyCell*)[tableView
							 dequeueReusableCellWithIdentifier:CellIdentifier];

	CTRentalProperty * property = [properties objectAtIndex:indexPath.row];
	
	if (cell == nil) {
		cell = [[[RentalPropertyCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:CellIdentifier] autorelease];
	}

	// Configure the cell.
	[cell setProperty:property];
	
//	int indexOfSemicolon = [property.address rangeOfString:@","].location;
//	NSString * address = [property.address
//						  substringToIndex:indexOfSemicolon];
//	NSString * city = [property.address
//					   substringFromIndex:indexOfSemicolon + 2];
//
//	cell.textLabel.text = address;
//
//	NSString * imageName = [cityMappings objectForKey:city];
//	cell.imageView.image = [UIImage imageNamed:imageName];
//	
//	cell.detailTextLabel.text =
//    [NSString stringWithFormat:@"Rents for $%0.2f per week",
//	 property.rentalPrice];    
	
	return cell;
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

