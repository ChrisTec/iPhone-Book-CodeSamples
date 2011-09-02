//
//  Task.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright (c) 2011 Springenwerk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Task : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * isDone;
@property (nonatomic, retain) NSManagedObject * person;

@end
