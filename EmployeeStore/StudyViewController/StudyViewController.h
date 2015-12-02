//
//  StudyViewController.h
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "RootViewController.h"

@interface StudyViewController : RootViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (instancetype)initWithUrlPath:(NSString *)path;
@end
