//
//  EmployeeManager.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "EmployeeManager.h"

@implementation EmployeeManager

static EmployeeManager *employeeManager;

+ (instancetype)instance {
    @synchronized(self) {
        if (!employeeManager) {
            [self new];
        }
    }
    return employeeManager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    @synchronized(self ) {
        if (!employeeManager) {
            employeeManager = [super allocWithZone:zone];
            return employeeManager;
        }
    }
    return nil;
}

- (void)initTabBarViewController{
    
    UIColor *mainColor = [MyCorlor colorWithHexString:@"#ed0593"];
    
    NSDictionary *selectedTitleAttributes = @{NSForegroundColorAttributeName: mainColor};
    
    self.mainTabBarController = [[UITabBarController alloc]init];
    
    StoreViewController *store = [[StoreViewController alloc] initWithNibName:@"StoreViewController" bundle:[NSBundle mainBundle]];
    store.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"直供店" image:[[UIImage imageNamed:@"storeIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"storeSelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [store.tabBarItem setTitleTextAttributes:selectedTitleAttributes forState:UIControlStateSelected];
    
    
    ServiceViewController *service = [[ServiceViewController alloc] initWithNibName:@"ServiceViewController" bundle:[NSBundle mainBundle]];
    service.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"服务" image:[[UIImage imageNamed:@"serviceIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"serviceSelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [service.tabBarItem setTitleTextAttributes:selectedTitleAttributes forState:UIControlStateSelected];
    
    StudyViewController *study = [[StudyViewController alloc] initWithNibName:@"StudyViewController" bundle:[NSBundle mainBundle]];
    study.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"学习" image:[[UIImage imageNamed:@"studyIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"studySelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [study.tabBarItem setTitleTextAttributes:selectedTitleAttributes forState:UIControlStateSelected];
    
    MineViewController *mine = [[MineViewController alloc] initWithNibName:@"MineViewController" bundle:[NSBundle mainBundle]];
    mine.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"mineIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"mineSelectedIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mine.tabBarItem setTitleTextAttributes:selectedTitleAttributes forState:UIControlStateSelected];
    
    NSArray *viewArr = @[store,service,study,mine];
    
    self.mainTabBarController.viewControllers = viewArr;
}

@end
