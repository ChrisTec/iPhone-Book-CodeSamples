//
//  PocketTasksAppDelegate.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PocketTasksAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)createSampleData;
- (void)dumpDataToConsole;

@end
