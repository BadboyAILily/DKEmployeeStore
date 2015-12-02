//
//  EmployeeManager.h
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MyCorlor.h"
#import "MineViewController.h"
#import "StudyViewController.h"
#import "ServiceViewController.h"
#import "StoreViewController.h"

#define kScreenSizeWidth [UIScreen mainScreen].bounds.size.width
#define kScreenSizeHeight [UIScreen mainScreen].bounds.size.height
@interface EmployeeManager : NSObject


@property (strong,nonatomic)UITabBarController *mainTabBarController;

+ (instancetype)instance;

@end
