//
//  TasksViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "Task.h"

@interface TasksViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
	Person *person;
	NSFetchedResultsController *resultsController;
}

- (id)initWithPerson:(NSManagedObject *)aPerson;

@end
