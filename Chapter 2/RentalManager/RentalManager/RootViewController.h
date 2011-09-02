//
//  RootViewController.h
//  RentalManager
//
//  Created by Amos Bannister on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {

}

typedef enum PropertyType {
    Unit,
    TownHouse,
    Mansion
} PropertyType;

typedef struct {
    NSString *address;
    PropertyType type;
    double weeklyRentalPrice;
} RentalProperty;

@end
