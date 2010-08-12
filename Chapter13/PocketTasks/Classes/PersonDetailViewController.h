//
//  PersonDetailViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 10.08.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface PersonDetailViewController : UIViewController {
	IBOutlet UITextField *firstNameTextField;
	IBOutlet UITextField *lastNameTextField;
	
	NSManagedObjectContext *managedObjectContext;
	Person *person;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc;

@end
