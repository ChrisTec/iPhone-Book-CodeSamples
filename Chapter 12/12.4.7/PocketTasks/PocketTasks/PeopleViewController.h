//
//  PeopleViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PeopleViewController : UITableViewController <NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *resultsController;
    NSManagedObjectContext *managedObjectContext;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc;

@end
