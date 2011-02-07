//
//  Task.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 12.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@class Person;

@interface Task :  NSManagedObject  
{
}

@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Person * person;

@end



