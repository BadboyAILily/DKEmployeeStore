//
//  StoreViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreInfoCell.h"
#import "ModuleCell.h"

#define ICON_WIDTH    45.f
#define ICON_HEIGHT   45.f

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *_background;
}

@property (weak, nonatomic) IBOutlet UITableView *storeTableView;

@property (nonatomic,assign)NSInteger index;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}


#pragma mark - UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.row == 0) {//门店地址和用户名
        static  NSString  *CellIdentiferId = @"StoreInfoCellId";
        StoreInfoCell  *storeCell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
        if (storeCell == nil) {
            storeCell = [[[NSBundle mainBundle]loadNibNamed:@"StoreInfoCell" owner:nil options:nil]lastObject];
        };
        storeCell.storeAddressLabel.text = @"上海";
        storeCell.userNameLabel.text = @"邓康";
        return storeCell;
    }else if(indexPath.row == 1){
        
        static  NSString  *CellIdentiferId = @"ModuleCellId";
        ModuleCell  *moduleCell = [tableView dequeueReusableCellWithIdentifier:CellIdentiferId];
        if (moduleCell == nil) {
            moduleCell = [[[NSBundle mainBundle]loadNibNamed:@"ModuleCell" owner:nil options:nil]lastObject];
        };
        for (UIButton *button in moduleCell.moduleButtonArr) {
            [button addTarget:self action:@selector(moduleAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        return moduleCell;


    }
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70.f;
    }else if(indexPath.row ==1){
        return 220.f;
    }else{
        return 0.1f;
    }
}


#pragma mark - 点击首页按钮
- (void)moduleAction:(UIButton *)button{
    NSInteger index = button.tag;
    switch (index) {
        case 200://产品中心
        {
            NSLog(@"产品中心");
        }
            break;
        case 201://营销活动
        {
            NSLog(@"营销活动");
        }
            break;

        case 202://招募伙伴
        {
            NSLog(@"招募伙伴");
        }
            break;

        case 203://客户管理
        {
            NSLog(@"客户管理");
        }
            break;

        case 204://收入统计
        {
            NSLog(@"收入统计");
        }
            break;

        case 205://我的订单
        {
            NSLog(@"我的订单");
        }
            break;

            
        default:
            break;
    }

}



@end
