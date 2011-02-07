//
//  TasksViewController.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 10.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TasksViewController.h"
#import "Task.h"


@interface TasksViewController (PrivateMethods)
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation TasksViewController


#pragma mark -
#pragma mark Initialization

- (id)initWithPerson:(Person *)aPerson {
	if (self = [super initWithStyle:UITableViewStylePlain]) {
		NSManagedObjectContext *moc = [aPerson managedObjectContext];
		person = [aPerson retain];
		
		self.title = [NSString stringWithFormat:@"%@ %@", [person valueForKey:@"firstName"], [person valueForKey:@"lastName"]];
		
		NSFetchRequest *request = [[NSFetchRequest alloc] init];
		[request setEntity:[NSEntityDescription entityForName:@"Task" 
									   inManagedObjectContext:moc]];
		// Tell the request that the people should be sorted by their last name
		[request setSortDescriptors:[NSArray arrayWithObject:
									 [NSSortDescriptor sortDescriptorWithKey:@"name" 
																   ascending:YES]]];
		
		// Tell the request only to fetch tasks that belong to the given person
		[request setPredicate:[NSPredicate predicateWithFormat:@"person == %@", person]];
		
		resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request 
																managedObjectContext:moc 
																  sectionNameKeyPath:nil 
																		   cacheName:nil];
		
		resultsController.delegate = self;
		
		[request release];
		
		NSError *error;
		
		if (![resultsController performFetch:&error]) {
			NSLog(@"Error while performing fetch: %@", error);
		}
	}
	
	return self;
}


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    // Add button
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTask)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
}


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Task *task = [resultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = task.name;
	
	if ([task.isDone boolValue]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

}

#pragma mark -
#pragma mark Add a new Task
- (void)addTask {
	// Create a new instance of the Task entity
	Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" 
										   inManagedObjectContext:[person managedObjectContext]];
	
	task.name = [NSString stringWithFormat:@"Task %i", [person.tasks count] + 1];
	task.isDone = [NSNumber numberWithBool:NO];
	
	[person addTasksObject:task];
	
	// Save the context.
	NSError *error = nil;
	if (![[person managedObjectContext] save:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	} else {
		// success
	}		
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[resultsController sections] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[resultsController sections] objectAtIndex:section] numberOfObjects];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"TaskCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell...
	[self configureCell:cell atIndexPath:indexPath];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        [[person managedObjectContext] deleteObject:[resultsController objectAtIndexPath:indexPath]];
        
        // Save the context.
        NSError *error = nil;
        if (![[person managedObjectContext] save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    Task *task = [resultsController objectAtIndexPath:indexPath];
	if (![[task valueForKey:@"isDone"] boolValue]) {		
		task.isDone = [NSNumber numberWithBool:YES];
		
		// Save the context.
        NSError *error = nil;
        if (![[task managedObjectContext] save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
		
		// update the cell to show the checkmark
		[self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
	}
}


#pragma mark -
#pragma mark Fetched results controller delegate


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[resultsController release];
	[person release];
    [super dealloc];
}


@end

