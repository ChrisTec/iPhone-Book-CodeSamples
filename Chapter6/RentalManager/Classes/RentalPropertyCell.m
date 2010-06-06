//
//  RentalPropertyCell.m
//  RentalManager
//
//  Created by Collin Ruffenach on 6/6/10.
//  Copyright 2010 SWIFT Consultants. All rights reserved.
//

#import "RentalPropertyCell.h"

@implementation RentalPropertyCell

@synthesize property;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withProperty:(CTRentalProperty*)prop {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
		
		property = prop;
		
		NSString * path = [[NSBundle mainBundle] pathForResource:@"CityMappings" ofType:@"plist"];	
		NSDictionary *cityMappings = [[NSDictionary alloc] initWithContentsOfFile:path];		
		int indexOfSemicolon = [property.address rangeOfString:@","].location;
		NSString * city = [property.address substringFromIndex:indexOfSemicolon + 2];
		NSString * imageName = [cityMappings objectForKey:city];
		self.imageView.image = [UIImage imageNamed:imageName];
		
		self.textLabel.text = prop.address;
		[self.textLabel setFont:[UIFont systemFontOfSize:12]];
		
		priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 60, 100, 30)];
		priceLabel.text = [NSString stringWithFormat:@"$%0.2f",property.rentalPrice];
		[priceLabel setTextColor:[UIColor redColor]];
		[priceLabel setBackgroundColor:[UIColor clearColor]];
		[self addSubview:priceLabel];
		
		propertyTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(225, 60, 100, 30)];
		
		if(property.propertyType == TownHouse) {
			propertyTypeLabel.text = @"Town House";
		}
		
		else if(property.propertyType == Unit) {
			propertyTypeLabel.text = @"Unit";
		}
		
		else if(property.propertyType == Mansion) {
			propertyTypeLabel.text = @"Mansion";
		}
		
		[propertyTypeLabel setTextColor:[UIColor greenColor]];
		[propertyTypeLabel setTextAlignment:UITextAlignmentRight];
		[propertyTypeLabel setBackgroundColor:[UIColor clearColor]];
		[self addSubview:propertyTypeLabel];
    }
	
    return self;
}

-(void)setProperty:(CTRentalProperty *)prop {
	
	property = prop;
	
	NSString * path = [[NSBundle mainBundle] pathForResource:@"CityMappings" ofType:@"plist"];	
	NSDictionary *cityMappings = [[NSDictionary alloc] initWithContentsOfFile:path];		
	int indexOfSemicolon = [property.address rangeOfString:@","].location;
	NSString * city = [property.address substringFromIndex:indexOfSemicolon + 2];
	NSString * imageName = [cityMappings objectForKey:city];
	self.imageView.image = [UIImage imageNamed:imageName];
	
	self.textLabel.text = prop.address;
	[self.textLabel setFont:[UIFont systemFontOfSize:13]];
	
	priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 50, 100, 30)];
	priceLabel.text = [NSString stringWithFormat:@"$%0.2f",property.rentalPrice];
	[priceLabel setTextColor:[UIColor redColor]];
	[priceLabel setBackgroundColor:[UIColor clearColor]];
	[self addSubview:priceLabel];
	
	propertyTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 100, 30)];
	
	if(property.propertyType == TownHouse) {
		propertyTypeLabel.text = @"Town House";
	}
	
	else if(property.propertyType == Unit) {
		propertyTypeLabel.text = @"Unit";
	}
	
	else if(property.propertyType == Mansion) {
		propertyTypeLabel.text = @"Mansion";
	}
	
	[propertyTypeLabel setTextColor:[UIColor colorWithRed:0 green:.617 blue:.117 alpha:1]];
	[propertyTypeLabel setTextAlignment:UITextAlignmentRight];
	[propertyTypeLabel setBackgroundColor:[UIColor clearColor]];
	[self addSubview:propertyTypeLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
