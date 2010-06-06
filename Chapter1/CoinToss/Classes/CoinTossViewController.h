//
//  CoinTossViewController.h
//  CoinToss
//
//  Created by Christopher Fairbairn on 19/03/10.
//  Copyright ChrisTec Limited 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoinTossViewController : UIViewController {
	UILabel * status;
	UILabel * result;
}

@property (nonatomic, retain) IBOutlet UILabel * status;
@property (nonatomic, retain) IBOutlet UILabel * result;

- (IBAction) callHeads;
- (IBAction) callTails;

@end

