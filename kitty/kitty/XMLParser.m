//
//  XMLParser.m
//  kitty
//
//  Created by Shilpi Singh on 10/6/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import "XMLParser.h"
#import "Post.h"

@interface XMLParser ()

@property NSXMLParser *parser;
@property NSString *element;


// Post properties
@property (strong, nonatomic) NSString *currentUserName;
@property (strong, nonatomic) NSDate *currentDate;
@property (nonatomic) NSInteger *currentViews;
@property (strong, nonatomic) NSString *currentImagePath;
@property (strong, nonatomic) NSString *currentUserImage;
@property (strong, nonatomic) NSString *currentPostImage;
@property (strong, nonatomic) NSString *currentPostTitle;
@property (nonatomic) NSInteger currentLikes;
@property (nonatomic) NSInteger currentReBoom;
@property (nonatomic) NSInteger currentTotalComments;

@end

@implementation XMLParser

- (id)initWithArray: (NSMutableArray *)postArray {
    self = [super init];
    if (self) {
        self.postArray = postArray;
    }
    return self;
}

-(void)parseXMLFile{
    
    NSURL *xmlPath = [[NSBundle mainBundle] URLForResource:@"UserInfo"
                                             withExtension:@"xml"];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
    
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
    //NSLog(@" Element %@", self.element);
    if ([self.element isEqualToString:@"user_name"]) {
        
        self.currentUserName = string;
        //NSLog(@"name : %@",string);
    }
    else if ([self.element isEqualToString:@"post_date"]) {
        self.currentDate = string;
        //NSLog(@"date : %@",string);
    }
    else if ([self.element isEqualToString:@"views"]) {
        self.currentViews = string.intValue;
       // NSLog(@"views : %@",string);
    }
    else if ([self.element isEqualToString:@"imagepath"]) {
        self.currentImagePath = string;
       /// NSLog(@"imagepath : %@",string);
    }
    else if ([self.element isEqualToString:@"user_image"]) {
        self.currentUserImage = string;
       /// NSLog(@"user_image : %@",string);
    }
    else if ([self.element isEqualToString:@"post_image"]) {
        self.currentPostImage = string;
        ///NSLog(@"post_image : %@",string);
    }
    else if ([self.element isEqualToString:@"post_title"]) {
        self.currentPostTitle = string;
        ///NSLog(@"post_title : %@",string);
    }
    else if ([self.element isEqualToString:@"likes"]) {
        self.currentLikes = string.intValue;
       // NSLog(@"likes : %@",string);
    }
    else if ([self.element isEqualToString:@"rebooms"]) {
        self.currentReBoom = string.intValue;
       // NSLog(@"rebooms : %@",string);
    }
    
    else if ([self.element isEqualToString:@"comments_total"]) {
        self.currentTotalComments = string.intValue;
        //NSLog(@"comments_total : %@",string);
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"post"]) {
        Post *post = [[Post alloc] initWithName:self.currentUserName
                                          title:self.currentPostTitle
                                          views:self.currentViews
                                      postImage:self.currentPostImage
                                          likes: self.currentLikes
                                         reboom: self.currentReBoom
                                   totalComment: self.currentTotalComments];
  
        [self.postArray addObject:post];
        
    }
    self.element = nil;
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"Error: %@", [parseError localizedDescription]);
}

@end
