//
//  RentalManagerAppDelegate.m
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright ChrisTec 2010. All rights reserved.
//

#import "RentalManagerAppDelegate.h"
#import "RootViewController.h"

@implementation RentalManagerAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

