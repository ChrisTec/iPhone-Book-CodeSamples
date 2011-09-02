//
//  Parser.h
//  Parser_Project
//
//  Created by Amos Bannister on 19/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject <NSXMLParserDelegate> {
    NSXMLParser *parser;
    NSMutableString *element;
}

@end
