//
//  RealEstateViewerAppDelegate.m
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import "RealEstateViewerAppDelegate.h"

@implementation RealEstateViewerAppDelegate


@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    imageTableViewController = [[ImageTableViewController alloc] init];
    
    [window addSubview:[imageTableViewController view]];
    [window makeKeyAndVisible];

    return YES;
}

- (void)dealloc
{
    [imageTableViewController release];
    [window release];
    [super dealloc];
}

@end
