//
//  WebBaseViewController.h
//  EmployeeStore
//
//  Created by 邓康 on 15/11/15.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "RootViewController.h"

@interface WebBaseViewController : RootViewController<UIScrollViewDelegate,UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (instancetype)initWithUrlPath:(NSString *)path;

@end
