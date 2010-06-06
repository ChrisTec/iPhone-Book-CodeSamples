//
//  RootViewController.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright ChrisTec Limited 2010. All rights reserved.
//

#import "RootViewController.h"

#define ARRAY_SIZE(x) (sizeof(x) / sizeof(x[0]))

RentalProperty properties[] = {
	{ @"13 Waverly Crescent, Sumner", TownHouse, 420.0f },
	{ @"74 Roberson Lane, Christchurch", Unit, 365.0f },
	{ @"17 Kipling Street, Riccarton", Unit, 275.9f },
	{ @"4 Everglade Ridge, Sumner", Mansion, 1500.0f  }, 
	{ @"19 Islington Road, Clifton", Mansion, 2000.0f }
};

@implementation RootViewController

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ARRAY_SIZE(properties);
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell = [tableView
							 dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell = [[[UITableViewCell alloc]
				 initWithStyle:UITableViewCellStyleSubtitle
				 reuseIdentifier:CellIdentifier] autorelease];
	}

	// Configure the cell.
	RentalProperty * details = &properties[indexPath.row];

	int indexOfSemicolon = [details->address rangeOfString:@","].location;
	NSString * address = [details->address
						  substringToIndex:indexOfSemicolon];
	NSString * city = [details->address
					   substringFromIndex:indexOfSemicolon + 2];

	cell.textLabel.text = address;

	if ([city isEqual:@"Clifton"])
		cell.imageView.image = [UIImage imageNamed:@"mountain.png"];
	else if ([city isEqual:@"Sumner"])
		cell.imageView.image = [UIImage imageNamed:@"sea.png"];
	else
		cell.imageView.image = [UIImage imageNamed:@"city.png"];
	
	cell.detailTextLabel.text =
    [NSString stringWithFormat:@"Rents for $%0.2f per week",
	 details->weeklyRentalPrice];       
	
	return cell;
}

@end

