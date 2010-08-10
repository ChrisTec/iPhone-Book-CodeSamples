//
//  PeopleViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 09.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PeopleViewController : UITableViewController {
	NSFetchedResultsController *resultsController;
	NSManagedObjectContext *managedObjectContext;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc;

@end
