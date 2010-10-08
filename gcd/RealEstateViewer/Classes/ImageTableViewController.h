//
//  ImageTableViewController.h
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 07.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageTableViewController : UITableViewController <UISearchBarDelegate> {
	NSArray *results;
}

@property (nonatomic, retain) NSArray *results;

@end
