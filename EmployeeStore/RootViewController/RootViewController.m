//
//  RootViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "RootViewController.h"

#define kBackButtonWidth  17
#define kBackButtonHeight 17


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)createBackButton{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //backButton.frame = CGRectMake(0, 0, 13, 22);
    backButton.frame = CGRectMake(0, 7, kBackButtonWidth, kBackButtonHeight);
    [backButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    //[backButton addTarget:self action:@selector(backToFront:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(-10, 50, 40, 30)];
    buttonView.backgroundColor = [UIColor clearColor];
    [buttonView addSubview:backButton];
    item1 = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(buttonView.frame.origin.x+buttonView.frame.size.width-20, 0, 50, 30)];
    grayView.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToFront:)];
    tapGr.cancelsTouchesInView = NO;
    [buttonView addGestureRecognizer:tapGr];
    
    item2 = [[UIBarButtonItem alloc]initWithCustomView:grayView];
}

- (void)backToFront:(UIGestureRecognizer *)tat{

}


@end
