//
//  RootViewController.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright ChrisTec 2010. All rights reserved.
//

@interface RootViewController : UITableViewController<UIActionSheetDelegate> {
	NSArray * allRentalProperties;
	NSArray * filteredRentalProperties;
}

- (IBAction) selectFilter;

@end
