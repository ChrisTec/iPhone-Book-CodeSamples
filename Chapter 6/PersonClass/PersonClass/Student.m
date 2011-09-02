//
//  Student.m
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Student.h"


@implementation Student

- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender classes:(NSArray *)_classes numberOfCredits:(NSNumber *)_numberOfCredits major:(NSString *)_major {
    if ([super init]) {
        name = _name;
        age = _age;
        gender = _gender;
        classes = _classes;
        numberOfCredits = _numberOfCredits;
        major = _major;
    }
    
    return self;
}

- (NSString *)description {
    if (gender==Male) {
        return [NSString stringWithFormat:@"%@. I am a male currently enrolled in %@ for $%@ credits with %@ as my major", [super description], classes, numberOfCredits, major];
    } else {
        return [NSString stringWithFormat:@"%@. I am a female currently enrolled in %@ for $%@ credits with %@ as my major", [super description], classes, numberOfCredits, major];
    }
}

@end
