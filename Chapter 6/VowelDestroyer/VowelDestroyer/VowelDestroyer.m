//
//  VowelDestroyer.m
//  VowelDestroyer
//
//  Created by Amos Bannister on 14/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VowelDestroyer.h"


@implementation NSString (VowelDestroyer)

- (NSString *)stringByDestroyingVowels {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    
    [mutableString replaceOccurrencesOfString:@"a" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"e" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"i" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"o" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    [mutableString replaceOccurrencesOfString:@"u" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, [mutableString length])];
    
    return [NSString stringWithString:mutableString];
}

@end
