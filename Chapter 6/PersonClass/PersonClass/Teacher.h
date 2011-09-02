//
//  Teacher.h
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Teacher : Person {
    NSArray *classes;
    NSNumber *salary;
    NSString *areaOfExpertise;
}

- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender classes:(NSArray *)_classes salary:(NSNumber *)_salary areaOfExpertise:(NSString *)_areaOfExpertise;

@end
