//
//  WebBaseViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/15.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "WebBaseViewController.h"

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
    self.navigationItem.leftBarButtonItems = @[item1,item2];
}

- (void)loadWebView{

    NSURL *url = [NSURL URLWithString:_mainPath];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
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
