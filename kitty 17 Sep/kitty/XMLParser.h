//
//  XMLParser.h
//  kitty
//
//  Created by Shilpi Singh on 10/6/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject <NSXMLParserDelegate>

@property(nonatomic, strong)NSMutableArray *postArray;
- (id)initWithArray: (NSMutableArray *)postArray;
- (void)parseXMLFile;

@end
