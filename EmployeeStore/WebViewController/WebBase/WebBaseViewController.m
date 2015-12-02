//
//  WebBaseViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/15.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "WebBaseViewController.h"

#define kBackButtonWidth  17
#define kBackButtonHeight 17

@interface WebBaseViewController ()

@property (retain, nonatomic) NSString *mainPath;

@end

@implementation WebBaseViewController


- (instancetype)initWithUrlPath:(NSString *)path {
    self = [super initWithNibName:@"WebBaseViewController" bundle:[NSBundle mainBundle]];
    if (self) {
        _mainPath = path;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
    [self createBackButton];
}

- (void)loadWebView{

    NSURL *url = [NSURL URLWithString:_mainPath];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
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
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(buttonView.frame.origin.x+buttonView.frame.size.width-20, 0, 50, 30)];
    grayView.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backToFront:)];
    tapGr.cancelsTouchesInView = NO;
    [buttonView addGestureRecognizer:tapGr];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:grayView];
    
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

- (void)backToFront:(UIBarButtonItem *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
