//
//  ImageTableViewController.h
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ImageTableViewController : UITableViewController <UISearchBarDelegate> {
    NSArray *results;
}

@property (nonatomic, retain) NSArray *results;

@end
