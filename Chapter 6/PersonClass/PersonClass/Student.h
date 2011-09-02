//
//  Student.h
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student : Person {
    NSArray *classes;
    NSNumber *numberOfCredits;
    NSString *major;
}

- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender classes:(NSArray *)_classes numberOfCredits:(NSNumber *)_numberOfCredits major:(NSString *)_major;

@end
