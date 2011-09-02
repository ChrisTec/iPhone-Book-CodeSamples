//
//  RootViewController.m
//  RentalManager
//
//  Created by Amos Bannister on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "CTRentalProperty.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityMappings" ofType:@"plist"];
    
    cityMappings = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    properties = [[NSArray alloc] initWithObjects:
                  [CTRentalProperty rentalPropertyOfType:TownHouse rentingFor:420.0f atAddress:@"13 Waverly Crescent, Sumner"],
                  [CTRentalProperty rentalPropertyOfType:Unit rentingFor:365.0f atAddress:@"74 Roberson Lane, Christchurch"],
                  [CTRentalProperty rentalPropertyOfType:Unit rentingFor:275.9f atAddress:@"17 Kipling Street, Riccarton"],
                  [CTRentalProperty rentalPropertyOfType:Mansion rentingFor:1500.0f atAddress:@"4 Everglade Ridge, Sumner"],
                  [CTRentalProperty rentalPropertyOfType:Mansion rentingFor:2000.0f atAddress:@"19 Islington Road, Clifton"],
                  nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [properties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier  = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    CTRentalProperty *property = [properties objectAtIndex:indexPath.row];
    
    int indexOfComma = [property.address rangeOfString:@","].location;
    NSString *address = [property.address substringToIndex:indexOfComma];
    NSString *city = [property.address substringFromIndex:indexOfComma + 2];
    
    cell.textLabel.text = address;
    
    NSString *imageName = [cityMappings objectForKey:city];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Rents for $%0.2f per week", property.rentalPrice];
    
    return cell;
}

- (void)dealloc {
    [cityMappings release];
    [properties release];
    [super dealloc];
}

@end