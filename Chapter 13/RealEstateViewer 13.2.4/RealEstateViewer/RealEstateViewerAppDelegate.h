//
//  RealEstateViewerAppDelegate.h
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageTableViewController.h"

@interface RealEstateViewerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImageTableViewController *imageTableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
