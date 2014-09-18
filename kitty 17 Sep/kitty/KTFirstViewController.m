//
//  KTFirstViewController.m
//  kitty
//
//  Created by Shilpi Singh on 9/12/14.
//  Copyright (c) 2014 Gliderport. All rights reserved.
//

#import "KTFirstViewController.h"

@interface KTFirstViewController ()

@end

@implementation KTFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //How many pages do we want?
    int PageCount = 3;
    
    //Setup scroll view
    UIScrollView *Scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 90, 320,330)];
    Scroller.backgroundColor = [UIColor clearColor];
    Scroller.pagingEnabled = YES;
    Scroller.contentSize = CGSizeMake(PageCount * Scroller.bounds.size.width, Scroller.bounds.size.height);
    
    //Setup Each View Size
    CGRect ViewSize = Scroller.bounds;
    
    //Setup and Add Images
    UIImageView *ImgView = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView setImage:[UIImage imageNamed:@"Page_1.png"]];
    [Scroller addSubview:ImgView];
    
    //Offset View Size
    ViewSize = CGRectOffset(ViewSize, Scroller.bounds.size.width, 0);
    
    UIImageView *ImgView2 = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView2 setImage:[UIImage imageNamed:@"Page_2.png"]];
    [Scroller addSubview:ImgView2];
    
    //Offset View Size
    ViewSize = CGRectOffset(ViewSize, Scroller.bounds.size.width, 0);
    
    UIImageView *ImgView3 = [[UIImageView alloc] initWithFrame:ViewSize];
    [ImgView3 setImage:[UIImage imageNamed:@"Page_3.png"]];
    [Scroller addSubview:ImgView3];
    
    
    CGRect newViewSize = Scroller.bounds;
    int NumberOfImages = 3;
    int i;
    for(i=0;i<NumberOfImages;i++){
        
        if(i == 0){
            //Setup first picture
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
            [ImgView setImage:[UIImage imageNamed:FilePath]];
            [Scroller addSubview:ImgView];
        }else{
            //Setup the rest of the pictures
            newViewSize = CGRectOffset(ViewSize, Scroller.bounds.size.width, 0);
            UIImageView *ImgView = [[UIImageView alloc] initWithFrame:newViewSize];
            NSString *FilePath = [NSString stringWithFormat:@"Page_%d.png", i];
            [ImgView setImage:[UIImage imageNamed:FilePath]];
            [Scroller addSubview:ImgView];
        }
    }
    
    [self.view addSubview:Scroller];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
