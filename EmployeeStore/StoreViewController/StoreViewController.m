//
//  StoreViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreInfoCell.h"

@interface StoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *storeTableView;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.storeTableView.rowHeight = 68;
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
    }
    return cell;
    
}

@end
