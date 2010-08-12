//
//  TasksViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 10.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface TasksViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	Person *person;
	NSFetchedResultsController *resultsController;
}

- (id)initWithPerson:(Person *)aPerson;

@end
