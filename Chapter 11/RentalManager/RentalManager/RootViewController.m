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
    
    allProperties = [[NSArray alloc] initWithObjects:
                  [CTRentalProperty rentalPropertyOfType:TownHouse rentingFor:420.0f atAddress:@"13 Waverly Crescent, Sumner"],
                  [CTRentalProperty rentalPropertyOfType:Unit rentingFor:365.0f atAddress:@"74 Roberson Lane, Christchurch"],
                  [CTRentalProperty rentalPropertyOfType:Unit rentingFor:275.9f atAddress:@"17 Kipling Street, Riccarton"],
                  [CTRentalProperty rentalPropertyOfType:Mansion rentingFor:1500.0f atAddress:@"4 Everglade Ridge, Sumner"],
                  [CTRentalProperty rentalPropertyOfType:Mansion rentingFor:2000.0f atAddress:@"19 Islington Road, Clifton"],
                  nil];
    filteredProperties = [[NSMutableArray alloc] initWithArray:allProperties];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(filterList)];
}

- (void)filterList {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Filter" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    
    [alert addButtonWithTitle:@"All"];
    [alert addButtonWithTitle:@"Properties on Roads"];
    [alert addButtonWithTitle:@"Less than $300pw"];
    [alert addButtonWithTitle:@"Between $250 and $450pw"];
    
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex != 0)
    {
        NSPredicate *predicate;
        
        switch (buttonIndex) {
            case 1:
                predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
                break;
            case 2:
                predicate = [NSPredicate predicateWithFormat:@"address CONTAINS 'Road'"];
                break;
            case 3:
                predicate = [NSPredicate predicateWithFormat:@"rentalPrice < 300"];
                break;
            case 4:
                predicate = [NSPredicate predicateWithFormat:@"rentalPrice BETWEEN { 250, 450 }"];
                break;
        }
        
        [filteredProperties release];
        filteredProperties = [[allProperties filteredArrayUsingPredicate:predicate] retain];
        
        [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [filteredProperties count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier  = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    CTRentalProperty *property = [filteredProperties objectAtIndex:indexPath.row];
    
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
    [allProperties release];
    [filteredProperties release];
    [super dealloc];
}

@end