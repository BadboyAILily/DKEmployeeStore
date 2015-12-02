//
//  StudyViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "StudyViewController.h"

#define kBackButtonWidth  17
#define kBackButtonHeight 17


@interface StudyViewController ()
{
    NSString *_mainPath;
}

@end

@implementation StudyViewController

- (instancetype)initWithUrlPath:(NSString *)path {
    self = [super initWithNibName:@"StudyViewController" bundle:[NSBundle mainBundle]];
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

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"studyURL:%@",request.URL.absoluteString);
    if([request.URL.absoluteString rangeOfString:@"salesStudy.html"].location != NSNotFound){
        self.navigationItem.leftBarButtonItems = nil;
    }else{
        self.navigationItem.leftBarButtonItems = @[item1,item2];

    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.navigationItem.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

- (void)backToFront:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    
}



@end
