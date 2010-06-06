//
//  RentalPropertyCell.h
//  RentalManager
//
//  Created by Collin Ruffenach on 6/6/10.
//  Copyright 2010 SWIFT Consultants. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTRentalProperty.h"
#import "RentalPropertyContext.h"

@interface ImportantRentalPropertyCell : UITableViewCell<RentalPropertyContext> {

	UILabel *priceLabel;
	UILabel *propertyTypeLabel;
	CTRentalProperty *property;
}

@property (nonatomic,retain) CTRentalProperty *property;

@end
