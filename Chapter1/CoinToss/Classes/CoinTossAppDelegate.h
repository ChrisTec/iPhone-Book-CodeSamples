//
//  CoinTossAppDelegate.h
//  CoinToss
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright ChrisTec Limited 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoinTossViewController;

@interface CoinTossAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoinTossViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoinTossViewController *viewController;

@end

