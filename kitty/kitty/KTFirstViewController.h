//
//  KTFirstViewController.h
//  kitty
//
//  Created by Shilpi Singh on 9/12/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"

@interface KTFirstViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) NSInteger *views;
@property (strong, nonatomic) NSString *imagePath;
@property (strong, nonatomic) NSString *postImagePath;
@property (strong, nonatomic) NSString *postImage;
@property (strong, nonatomic) NSString *postTitle;
@property (nonatomic) NSInteger likes;
@property (nonatomic) NSInteger reBoom;
@property (nonatomic) NSInteger totalComments;

@end
