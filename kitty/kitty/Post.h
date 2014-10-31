//
//  Post.h
//  kitty
//
//  Created by Shilpi Singh on 10/6/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property NSString *name;
@property NSString *title;
@property NSInteger views;
@property NSString *postImage;
@property NSInteger likes;
@property NSInteger reBoom;
@property NSInteger totalComments;

- (id)initWithName: (NSString *)name
             title: (NSString *)title
             views:(NSInteger) views
         postImage:(NSString *)postImage
             likes: (NSInteger)likes
            reboom: (NSUInteger)reBoom
      totalComment: (NSUInteger)totalComments;

@end
