//
//  PeopleViewController.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 09.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PeopleViewController.h"
#import "PersonDetailViewController.h"
#import "TasksViewController.h"

@interface PeopleViewController (PrivateMethods)
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end


@implementation PeopleViewController


#pragma mark -
#pragma mark Initialization

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
	if (self = [super initWithStyle:UITableViewStylePlain]) {
		managedObjectContext = [moc retain];
		
		self.title = @"People";
		
		NSFetchRequest *request = [[NSFetchRequest alloc] init];
		[request setEntity:[NSEntityDescription entityForName:@"Person" 
									   inManagedObjectContext:moc]];
		// Tell the request that the people should be sorted by their last name
		[request setSortDescriptors:[NSArray arrayWithObject:
									 [NSSortDescriptor sortDescriptorWithKey:@"lastName" 
																   ascending:YES]]];
		
		resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request 
																managedObjectContext:moc 
																  sectionNameKeyPath:nil 
																		   cacheName:@"Person"];
		
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
	
	// Edit button
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
	
	// Add button
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPerson)];
    self.navigationItem.rightBarButtonItem = addButton;
    [addButton release];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    NSManagedObject *person = [resultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", [person valueForKey:@"firstName"], [person valueForKey:@"lastName"]];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%i tasks", [[person valueForKey:@"tasks"] count]];
}

#pragma mark -
#pragma mark Add a new person

- (void)addPerson {	
	// Create a new instance of the detail view controller
	PersonDetailViewController *detailController = [[PersonDetailViewController
													 alloc] initWithManagedObjectContext:managedObjectContext];
	
	// Wrap it in a UINavigationController so we have a navigation bar on top...
	UINavigationController *controller = [[UINavigationController alloc]
										  initWithRootViewController:detailController];
	
	// ... that we can add a save button to
	detailController.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]
														   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
														   target:detailController 
														   action:@selector(saveAndDismiss)] autorelease];
	
	// Present it modally
	[self presentModalViewController:controller animated:YES];
	
	// Clean up
	[controller release];
	[detailController release];
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

    static NSString *CellIdentifier = @"PersonCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
	[self configureCell:cell atIndexPath:indexPath];
	
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the managed object for the given index path
        [managedObjectContext deleteObject:[resultsController objectAtIndexPath:indexPath]];
        
        // Save the context.
        NSError *error = nil;
        if (![managedObjectContext save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
	 TasksViewController *tasksViewController = [[TasksViewController alloc] initWithPerson:[resultsController objectAtIndexPath:indexPath]];

	 [self.navigationController pushViewController:tasksViewController animated:YES];
	 [tasksViewController release];
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
	[managedObjectContext release];
	[resultsController release];
    [super dealloc];
}


@end

