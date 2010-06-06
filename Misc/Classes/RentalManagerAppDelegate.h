//
//  RentalManagerAppDelegate.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright ChrisTec 2010. All rights reserved.
//

@interface RentalManagerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

