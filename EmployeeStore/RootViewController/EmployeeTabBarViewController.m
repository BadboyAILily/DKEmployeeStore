//
//  EmployeeTabBarViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/15.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "EmployeeTabBarViewController.h"
#import "MyCorlor.h"
#import "MineViewController.h"
#import "StudyViewController.h"
#import "ServiceViewController.h"
#import "StoreViewController.h"

@interface EmployeeTabBarViewController ()

@end

@implementation EmployeeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  添加所有子控制器方法
 */
- (void)setUpAllChildViewController{
    // 1.添加第一个控制器
    StoreViewController *store = [[StoreViewController alloc]init];
    [self setUpOneChildViewController:store image:[self imageNamed:@"storeIcon"] selectedImage:[self imageNamed:@"storeSelectedIcon"] title:@"直供店"];
    
    // 2.添加第2个控制器
    ServiceViewController *service = [[ServiceViewController alloc]init];
    [self setUpOneChildViewController:service image:[self imageNamed:@"serviceIcon"] selectedImage:[self imageNamed:@"serviceSelectedIcon"] title:@"服务"];

    // 3.添加第3个控制器
    StudyViewController *study = [[StudyViewController alloc]init];
    [self setUpOneChildViewController:study image:[self imageNamed:@"studyIcon"] selectedImage:[self imageNamed:@"studySelectedIcon"] title:@"学习"];
    
    // 4.添加第4个控制器
    MineViewController *mine = [[MineViewController alloc]init];
    [self setUpOneChildViewController:mine image:[self imageNamed:@"mineIcon"] selectedImage:[self imageNamed:@"mineSelectedIcon"] title:@"我的"];
    
}


/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title{
    
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:viewController];
    NSLog(@"%@",viewController.class);
    if ([viewController.class isSubclassOfClass:[StoreViewController class]]) {
        viewController.navigationItem.title = @"消费创业";
    }else{
        
        viewController.navigationItem.title = title;
    }
    navC.title = title;
    navC.tabBarItem.image = image;
    navC.tabBarItem.selectedImage = selectedImage;
    
    UIColor *mainColor = [MyCorlor colorWithHexString:@"#ed0593"];
    NSDictionary *selectedTitleAttributes = @{NSForegroundColorAttributeName: mainColor};
    [navC.tabBarItem setTitleTextAttributes:selectedTitleAttributes forState:UIControlStateSelected];
    
    
    
    [self addChildViewController:navC];
}

- (UIImage *)imageNamed:(NSString *)imageName{

    return [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
