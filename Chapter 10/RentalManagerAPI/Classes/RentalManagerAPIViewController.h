//
//  RentalManagerAPIViewController.h
//  RentalManagerAPI
//
//  Created by Johannes Fahrenkrug on 26.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RentalManagerAPIViewController : UIViewController {
	IBOutlet UITextField *nameTextField;
	IBOutlet UITextField *cityTextField;
	IBOutlet UITextField *priceTextField;
}

- (IBAction)publishAd:(id)sender;

@end

