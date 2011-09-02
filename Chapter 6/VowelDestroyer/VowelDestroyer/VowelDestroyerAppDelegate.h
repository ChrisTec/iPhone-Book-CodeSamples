//
//  VowelDestroyerAppDelegate.h
//  VowelDestroyer
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VowelDestroyerViewController;

@interface VowelDestroyerAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet VowelDestroyerViewController *viewController;

@end
