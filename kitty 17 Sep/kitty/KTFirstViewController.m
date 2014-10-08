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
@end

@implementation KTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.postArray = [[NSMutableArray alloc] init];
    XMLParser *postParser = [[XMLParser alloc] initWithArray:self.postArray ];
    [postParser parseXMLFile];
    [self createScrollView];
}

-(void)createScrollView
{
    int PageCount = self.postArray.count;
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 350)];
    //scroller.contentSize = CGSizeMake(320, PageCount * 1500);
    scroller.contentSize = CGSizeMake(scroller.bounds.size.width, PageCount * scroller.bounds.size.height);
    scroller.backgroundColor = [UIColor clearColor];
    scroller.pagingEnabled = YES;
    
    CGRect newViewSize = scroller.bounds;
   // XMLParser *loadXMLData = [[XMLParser alloc]init];

    

    int NumberOfImages = self.postArray.count;
    
    XMLParser *postParser = [[XMLParser alloc] initWithArray:self.postArray ];
    [postParser parseXMLFile];

    
    for(int i=0;i<NumberOfImages;i++){
        
        if(i == 0){
            //Setup first picture
        
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
            Post *currentPost = self.postArray[i];

            //NSLog(@"From array3 %@",currentPost.postImage);
           [ImgView setImage:[UIImage imageNamed:currentPost.postImage]];
            [scroller addSubview:ImgView];
        }else{
            //Setup the rest of the pictures
            
            newViewSize = CGRectOffset(newViewSize, 0, scroller.bounds.size.width);
            
            Post *currentPost = self.postArray[i];
            
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];

            [ImgView setImage:[UIImage imageNamed:currentPost.postImage]];
            [scroller addSubview:ImgView];
        }
   }
    
    [self.view addSubview:scroller];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
