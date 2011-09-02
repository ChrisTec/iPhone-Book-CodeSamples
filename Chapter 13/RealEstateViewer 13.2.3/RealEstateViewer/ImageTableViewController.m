//
//  ImageTableViewController.m
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 13/05/11.
//  Copyright 2011 Springenwerk. All rights reserved.
//

#import "ImageTableViewController.h"
#import "JSON.h"


@implementation ImageTableViewController
@synthesize results;

#pragma mark -
#pragma mark Initialization

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
        results = [NSArray array];
        
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0)];
        searchBar.delegate = self;
        searchBar.showsCancelButton = YES;
        [searchBar sizeToFit];
        
        self.tableView.tableHeaderView = searchBar;
        [searchBar release];
        
        self.tableView.rowHeight = 160;
    }
    return self;
}

#pragma mark -
#pragma mark UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Searching for: %@", searchBar.text);
    NSString *api = @"http://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=large&q=";
    NSString *urlString = [NSString stringWithFormat:@"%@real%%20estate%%20%@", api, 
                           [searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [NSThread sleepForTimeInterval:1.5];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    self.results = [[[res JSONValue] objectForKey:@"responseData"] objectForKey:@"results"];
    
    [res release];
    [searchBar resignFirstResponder];
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    } else {
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
    }
    
    UIImage *image = [[results objectAtIndex:indexPath.row] objectForKey:@"image"];
    
    if (!image) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[results objectAtIndex:indexPath.row] objectForKey:@"unescapedUrl"]]]];
        
        [[results objectAtIndex:indexPath.row] setValue:image forKey:@"image"];
    }
    
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.frame = cell.contentView.frame;
    
    [cell.contentView addSubview:imageView];
    
    return cell;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [results release];
    [super dealloc];
}

@end
