//
//  RealEstateViewerAppDelegate.m
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 07.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import "RealEstateViewerAppDelegate.h"

@implementation RealEstateViewerAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    imageTableViewController = [[ImageTableViewController alloc] init];
    
	[window addSubview:[imageTableViewController view]];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)dealloc {
	[imageTableViewController release];
    [window release];
    [super dealloc];
}


@end
