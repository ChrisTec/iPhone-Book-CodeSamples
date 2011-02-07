//
//  RealEstateViewerAppDelegate.h
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 07.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageTableViewController.h"

@interface RealEstateViewerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	ImageTableViewController *imageTableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

