//
//  Person.m
//  PersonClass
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

- (id)init {
    if ((self = [super init])) {
        name = @"Person";
        age = [NSNumber numberWithInt:-1];
        gender = Male;
    }
    
    return self;
}

- (id)initWithName:(NSString *)_name {
    if ((self = [super init])) {
        name = _name;
        age = [NSNumber numberWithInt:-1];
        gender = Male;
    }
    
    return self;
}

- (id)initWithAge:(NSNumber *)_age {
    if ((self = [super init])) {
        name = @"Person";
        age = _age;
        gender = Male;
    }
    
    return self;
}

- (id)initWithGender:(Gender)_gender {
    if ((self = [super init])) {
        name = @"Person";
        age = [NSNumber numberWithInt:-1];
        gender = _gender;
    }
    
    return self;
}

- (id)initWithName:(NSString *)_name age:(NSNumber *)_age gender:(Gender)_gender {
    if ((self = [super init])) {
        name = _name;
        age = _age;
        gender = _gender;
    }
    
    return self;
}

- (NSString *)name {
    if (name) {
        return name;
    } else

    return @"--unknown--";
}

- (NSNumber *)age {
    if (age) {
        return age;
    } else

    return [NSNumber numberWithInt:-1];
}

- (Gender)gender {
    if (gender) {
        return gender;
    }

    return -1;
}

- (void)setName:(NSString *)_name {
    if (name) {
        name = _name;
    }
}

- (void)setAge:(NSNumber *)_age {
    if (age) {
        age = _age;
    }
}

- (void)setGender:(Gender)_gender {
    if (gender) {
        gender = _gender;
    }
}

- (NSString *)description {
    if (gender==Male) {
        return [NSString stringWithFormat:@"Hi! I am a man, named %@, who is %@ years old", name, age];
    } else {
        return [NSString stringWithFormat:@"Hi! I am a woman, named %@, who is %@ years old", name, age];
    }
}

@end
