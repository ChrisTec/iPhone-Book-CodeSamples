//
//  CoinTossAppDelegate.h
//  CoinToss
//
//  Created by Amos Bannister on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoinTossViewController;

@interface CoinTossAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoinTossViewController *viewController;

@end
