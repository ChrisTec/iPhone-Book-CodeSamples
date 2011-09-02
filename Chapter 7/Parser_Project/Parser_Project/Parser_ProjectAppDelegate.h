//
//  Parser_ProjectAppDelegate.h
//  Parser_Project
//
//  Created by Amos Bannister on 19/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Parser_ProjectViewController;

@interface Parser_ProjectAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Parser_ProjectViewController *viewController;

@end
