//
//  KTFirstViewController.m
//  kitty
//
//  Created by Shilpi Singh on 9/12/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import "KTFirstViewController.h"
#import "XMLParser.h"
#import "Post.h"

@interface KTFirstViewController ()
@property(nonatomic, strong)NSMutableArray *postArray;
@property (nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *arrItems;
@property(nonatomic, strong)NSArray *germanMakes;
@property (nonatomic, strong) IBOutlet UILabel *rightLabel;
@property(nonatomic, readonly, retain) UIView *contentView;
@end

@implementation KTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.postArray = [[NSMutableArray alloc] init];
    XMLParser *postParser = [[XMLParser alloc] initWithArray:self.postArray ];
    [postParser parseXMLFile];
    //[self createScrollView];
    
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, 300, 350)] ;
    tableView.dataSource = self;
    tableView.delegate = self;
      //NSLog(@"total item in table %d",1);
    [self.view addSubview:tableView];
      //NSLog(@"total item in table %d",1);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    // Return the number of rows in the section.
    //NSLog(@"count : %ld", self.postArray.count);
    return self.postArray.count;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }

        Post *currentPost = self.postArray[indexPath.row];
        //cell.textLabel.text = currentPost.name;
    //NSLog(@"count : %@", currentPost.title);
    
    //cell.detailTextLabel.text = currentPost.title;
    
    UIImageView *userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    [userImageView setImage:[UIImage imageNamed:currentPost.postImage]];
    [cell.contentView addSubview:userImageView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, 20)];
    nameLabel.font=[nameLabel.font fontWithSize:10];
    [nameLabel setText:currentPost.name];
    [nameLabel setTag:3];
    [cell.contentView addSubview:nameLabel];
    
//    cell.imageView.frame = CGRectMake(20, 20, 32, 32);
//    cell.imageView.image = [UIImage imageNamed:currentPost.postImage ];
    //cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UILabel *viewValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 50, 20)];
    [viewValueLabel setTextAlignment:NSTextAlignmentRight];
    [viewValueLabel setText:[NSString stringWithFormat:@"%ld", (long)currentPost.views]];
    viewValueLabel.font=[viewValueLabel.font fontWithSize:10];
    [viewValueLabel setTag:3];
    [cell.contentView addSubview:viewValueLabel];
    
    UILabel *viewLabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 20, 50, 20)];
    [viewLabel setTextAlignment:NSTextAlignmentRight];
    [viewLabel setText:@"views"];
    viewLabel.font=[viewLabel.font fontWithSize:10];
    [viewLabel setTag:3];
    [cell.contentView addSubview:viewLabel];

    
     UIImageView *ImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 200)];
    [ImgView setImage:[UIImage imageNamed:currentPost.postImage]];
     [cell.contentView addSubview:ImgView];
    
    UILabel *titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 100, 20)];
    titileLabel.font=[titileLabel.font fontWithSize:10];
    [titileLabel setText:currentPost.title];
    [titileLabel setTag:3];
    [cell.contentView addSubview:titileLabel];
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 265, 200, 20)];
    detailLabel.font=[titileLabel.font fontWithSize:8];
    NSString *detailString = [[[[[[NSString stringWithFormat:@"%ld", currentPost.likes]
                              stringByAppendingString:@" likes - " ]stringByAppendingString:[NSString stringWithFormat:@"%ld", currentPost.reBoom] ]stringByAppendingString:@" rebooms - "]stringByAppendingString:[NSString stringWithFormat:@"%ld", currentPost.totalComments] ]stringByAppendingString:@" comments"];
    //detailString = [detailString stringByAppendingString:[NSString stringWithFormat:@"%ld", currentPost.reBoom]];
    [detailLabel setText:detailString ];
    [detailLabel setTag:3];
    [cell.contentView addSubview:detailLabel];
 
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
