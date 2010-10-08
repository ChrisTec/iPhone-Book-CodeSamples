//
//  ImageTableViewController.m
//  RealEstateViewer
//
//  Created by Johannes Fahrenkrug on 07.10.10.
//  Copyright 2010 Springenwerk. All rights reserved.
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
		
		UISearchBar *searchBar = [[UISearchBar alloc] 
			initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 0)];  
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
	NSString *api = @"http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=";
	NSString *urlString = [NSString stringWithFormat:@"%@real%%20estate%%20%@", api, 
						   [searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	NSURL *url = [NSURL URLWithString:urlString];
	
	// sleep for 2 seconds to pretend possible network lag
	[NSThread sleepForTimeInterval:2];
	NSData *data = [NSData dataWithContentsOfURL:url];
	NSString *res = [[NSString alloc] initWithData:data 
										  encoding:NSUTF8StringEncoding];
//	NSLog(@"%@", [res JSONValue]);
	
	self.results = [[[res JSONValue] objectForKey:@"responseData"] objectForKey:@"results"];
	
	
	
	[self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
	[searchBar resignFirstResponder];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [results count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView 
							 dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	UIImageView *imageView = [[[UIImageView alloc] initWithImage:
							   [UIImage imageWithData:
								[NSData dataWithContentsOfURL:
								 [NSURL URLWithString:[[results objectAtIndex:indexPath.row] objectForKey:@"url"]]]]] autorelease];
	
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
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

