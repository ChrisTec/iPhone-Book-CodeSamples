//
//  PocketTasksAppDelegate.m
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 05.08.10.
//  Copyright Springenwerk 2010. All rights reserved.
//

#import "PocketTasksAppDelegate.h"
#import "PeopleViewController.h"


@implementation PocketTasksAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application 
        didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	//[self createSampleData];
	//[self dumpDataToConsole];
	
	PeopleViewController *peopleViewController = [[PeopleViewController alloc] 
												  initWithManagedObjectContext:[self managedObjectContext]];
	navigationController = [[UINavigationController alloc] initWithRootViewController:peopleViewController];
	[peopleViewController release];
	peopleViewController = nil;
	
	[window addSubview:[navigationController view]];
	
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)createSampleData {
	// Create a list of sample names to add.
	NSArray *peopleToAdd = [NSArray arrayWithObjects:
							[NSArray arrayWithObjects:@"Peter", @"Pan", nil],
							[NSArray arrayWithObjects:@"Bob", @"Dylan", nil],
							[NSArray arrayWithObjects:@"Weird Al", @"Yankovic", nil],
							nil];
	
	// Iterate over each name
	for (NSArray *names in peopleToAdd) {
		// Create a new Person entity in our managedObjectContext
		NSManagedObject *newPerson = [NSEntityDescription insertNewObjectForEntityForName:@"Person"
																   inManagedObjectContext:[self managedObjectContext]];
		
		// Set the firstName and lastName values of our new person
		[newPerson setValue:[names objectAtIndex:0] forKey:@"firstName"];
		[newPerson setValue:[names objectAtIndex:1] forKey:@"lastName"];
		
		NSLog(@"Creating %@ %@...", [names objectAtIndex:0], [names objectAtIndex:1]);
	}
	
	// Save everything
	NSError *error = nil;
	if (![[self managedObjectContext] save:&error]) {
		NSLog(@"Error saving the managedObjectContext: %@", error);
	} else {
		NSLog(@"managedObjectContext successfully saved!");
	}
}

- (void)dumpDataToConsole {
	NSManagedObjectContext *moc = [self managedObjectContext];
	// Create an NSFetchRequest for the Person entity
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:@"Person" 
								   inManagedObjectContext:moc]];
	// Tell the request that the people should be sorted by their last name
	[request setSortDescriptors:[NSArray arrayWithObject:
								 [NSSortDescriptor sortDescriptorWithKey:@"lastName" 
															   ascending:YES]]];
	NSError *error = nil;
	// Execute the fetch request
	NSArray *people = [moc executeFetchRequest:request error:&error];
	[request release];
	
	if (error) {
		NSLog(@"Error fetching the person entities: %@", error);
	} else {
		for (NSManagedObject *person in people) {
			NSLog(@"Found: %@ %@", [person valueForKey:@"firstName"], 
				  [person valueForKey:@"lastName"]);
		}
	}
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    
    NSError *error = nil;
    if (managedObjectContext_ != nil) {
        if ([managedObjectContext_ hasChanges] && ![managedObjectContext_ save:&error]) {
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
#pragma mark Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    if (managedObjectContext_ != nil) {
        return managedObjectContext_;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        managedObjectContext_ = [[NSManagedObjectContext alloc] init];
        [managedObjectContext_ setPersistentStoreCoordinator:coordinator];
    }
    return managedObjectContext_;
}


/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel_ != nil) {
        return managedObjectModel_;
    }
    NSString *modelPath = [[NSBundle mainBundle] pathForResource:@"PocketTasks" ofType:@"momd"];
    NSURL *modelURL = [NSURL fileURLWithPath:modelPath];
    managedObjectModel_ = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return managedObjectModel_;
}


/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentStoreCoordinator_ != nil) {
        return persistentStoreCoordinator_;
    }
    
    NSURL *storeURL = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory] stringByAppendingPathComponent: @"PocketTasks.sqlite"]];
	
	NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
							 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
							 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    persistentStoreCoordinator_ = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![persistentStoreCoordinator_ addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return persistentStoreCoordinator_;
}


#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the path to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    
    [managedObjectContext_ release];
    [managedObjectModel_ release];
    [persistentStoreCoordinator_ release];
	
	[navigationController release];
    
    [window release];
    [super dealloc];
}


@end

