//
//  RootViewController.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright ChrisTec Limited 2010. All rights reserved.
//

typedef enum PropertyType {
	Unit,
	TownHouse,
	Mansion
} PropertyType;

typedef struct {
	NSString * address;
	PropertyType type;
	double weeklyRentalPrice;
} RentalProperty;

@interface RootViewController : UITableViewController {
}

@end
