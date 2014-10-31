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
             views:(NSInteger) views
         postImage:(NSString *)postImage
             likes: (NSInteger)likes
            reboom: (NSUInteger)reBoom
      totalComment: (NSUInteger)totalComments
{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.title = title;
        self.views = views;
        self.postImage = postImage;
        self.likes = likes;
        self.reBoom = reBoom;
        self.totalComments = totalComments;
        
    }
    return self;
}
@end
