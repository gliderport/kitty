//
//  Post.m
//  kitty
//
//  Created by Shilpi Singh on 10/6/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import "Post.h"

@implementation Post

- (id)initWithName: (NSString *)name
             title: (NSString *)title
             likes: (NSUInteger)likes
         postImage:(NSString *)postImage
{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.title = title;
        self.likes = likes;
        self.postImage = postImage;
        
    }
    return self;
}
@end
