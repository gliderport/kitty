//
//  KTFirstViewController.m
//  kitty
//
//  Created by Shilpi Singh on 9/12/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import "KTFirstViewController.h"
#import "XMLParser.h"

@interface KTFirstViewController ()

@end

@implementation KTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createScrollView];
}

-(void)createScrollView
{
    int PageCount = 15;
    
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 350)];
    //scroller.contentSize = CGSizeMake(320, PageCount * 1500);
    scroller.contentSize = CGSizeMake(scroller.bounds.size.width, PageCount * scroller.bounds.size.height);
    
    //Setup Each View Size
    //CGRect ViewSize = CGRectMake(0, 0, 320, 1500);
    CGRect ViewSize = scroller.bounds;
    //
    //Setup and Add Images
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView setImage:[UIImage imageNamed:@"Page_1.png"]];
    [scroller addSubview:ImgView];
    
    //Offset View Size
    ViewSize = CGRectOffset(ViewSize, scroller.bounds.size.width, 0);
    
    UIImageView *ImgView2 = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView2 setImage:[UIImage imageNamed:@"Page_2.png"]];
    [scroller addSubview:ImgView2];
    
    UIImageView *ImgView3 = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView3 setImage:[UIImage imageNamed:@"Page_3.png"]];
    [scroller addSubview:ImgView3];
    
    CGRect newViewSize = scroller.bounds;
    int NumberOfImages = 15;
    int i;
    for(i=0;i<NumberOfImages;i++){
        
        if(i == 0){
            //Setup first picture
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
            [ImgView setImage:[UIImage imageNamed:FilePath]];
            [scroller addSubview:ImgView];
        }else{
            //Setup the rest of the pictures
            newViewSize = CGRectOffset(ViewSize, scroller.bounds.size.width, 0);
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
            [ImgView setImage:[UIImage imageNamed:FilePath]];
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
