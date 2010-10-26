//
//  RentalManagerAPIAppDelegate.h
//  RentalManagerAPI
//
//  Created by Johannes Fahrenkrug on 26.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RentalManagerAPIViewController;

@interface RentalManagerAPIAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RentalManagerAPIViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RentalManagerAPIViewController *viewController;

@end

