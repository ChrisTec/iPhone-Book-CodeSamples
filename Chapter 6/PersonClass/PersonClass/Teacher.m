//
//  Teacher.m
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Teacher.h"


@implementation Teacher

- (id)initWithName:(NSString *)_name 
               age:(NSNumber *)_age 
            gender:(Gender)_gender 
           classes:(NSArray *)_classes 
            salary:(NSNumber *)_salary 
   areaOfExpertise:(NSString *)_areaOfExpertise
{
    if ([super init]) {
        name = _name;
        age = _age;
        gender = _gender;
        classes = _classes;
        salary = _salary;
        areaOfExpertise = _areaOfExpertise;
    }
    
    return self;
}

- (NSString *)description {
    if (gender==Male) {
        return [NSString stringWithFormat:@"%@. I am a male currently teaching %@ for $%@ per year with expertise in %@", [super description], classes, salary, areaOfExpertise];
    } else {
        return [NSString stringWithFormat:@"%@. I am a female currently teaching %@ for $%@ per year with expertise in %@", [super description], classes, salary, areaOfExpertise];
    }
}

@end
