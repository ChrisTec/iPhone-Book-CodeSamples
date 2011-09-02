//
//  Person.h
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Male, Female
} Gender;

@interface Person : NSObject {
    NSString *name;
    NSNumber *age;
    Gender gender;
}

- (NSString *)name;
- (NSNumber *)age;
- (Gender)gender;

- (void)setName:(NSString *)_name;
- (void)setAge:(NSNumber *)_age;
- (void)setGender:(Gender)_gender;

- (id)initWithName:(NSString *)_name;
- (id)initWithAge:(NSNumber *)_age;
- (id)initWithAge:(NSNumber *)_age;
- (id)initWithGender:(Gender)_gender;
- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender;

@end
