//
//  myProtocolAppDelegate.h
//  myProtocol
//
//  Created by Amos Bannister on 19/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myView.h"

@interface myProtocolAppDelegate : NSObject <UIApplicationDelegate, animationNotification> {
    UIWindow *window;
    myView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void)animate;

@end
