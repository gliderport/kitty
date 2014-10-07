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
@property NSInteger *likes;

- (id)initWithName: (NSString *)name
             title: (NSString *)title
             likes: (NSUInteger)likes;
@end
