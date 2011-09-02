//
//  PersonDetailViewController.h
//  PocketTasks
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonDetailViewController : UIViewController {
    IBOutlet UITextField *firstNameTextField;
    IBOutlet UITextField *lastNameTextField;
    
    NSManagedObjectContext *managedObjectContext;
    NSManagedObject *person;
}

- (id)initWithManagedObjectContext:(NSManagedObjectContext *)moc;

@end
