//
//  Person.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 12.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface Person :  NSManagedObject  
{
}

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSSet* tasks;
@property (readonly) NSString * fullName;

@end


@interface Person (CoreDataGeneratedAccessors)
- (void)addTasksObject:(NSManagedObject *)value;
- (void)removeTasksObject:(NSManagedObject *)value;
- (void)addTasks:(NSSet *)value;
- (void)removeTasks:(NSSet *)value;

@end

