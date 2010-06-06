//
//  CTPerson.h
//  RentalManager
//
//  Created by Christopher Fairbairn on 26/01/10.
//  Copyright 2010 ChrisTec. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CTPerson : NSObject {
	NSString * name;
	int age;
}

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int age;

+ (id) personWithName:(NSString *)name andAge:(int)age;

- (id) initWithName:(NSString *)name andAge:(int)age;

@end
