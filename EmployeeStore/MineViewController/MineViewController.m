//
//  MineViewController.m
//  EmployeeStore
//
//  Created by 邓康 on 15/11/14.
//  Copyright (c) 2015年 Dkang. All rights reserved.
//

#import "MineViewController.h"
#import "EmployeeManager.h"
#import "MineCell.h"
#import "SetVipInfoCell.h"

#import "WebBaseViewController.h"

#define ROWHEIGHT 44.f

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{

}
@property (weak, nonatomic) IBOutlet UITableView *mineTableView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 2;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cellId";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    cell.selectionStyle =  UITableViewCellSeparatorStyleNone;
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil]firstObject ];
    }
    
    if (indexPath.section==0) {
        
        return [self drawVipInfoCell:tableView atIndexPath:indexPath];
    }
    
    if(indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3){
        return [self drawOperationCell:tableView atIndexPath:indexPath];
        
    }
    
    return [self drawLogoutCell:tableView atIndexPath:indexPath];
    
    
    
    return cell;
    
}

#pragma mark - draw cell

- (SetVipInfoCell *)drawVipInfoCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"vipInfoCell";
    
    SetVipInfoCell *vipCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!vipCell) {
        vipCell = [[[NSBundle mainBundle]loadNibNamed:@"SetVipInfoCell" owner:self options:nil]firstObject];
        
    }
    
    vipCell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if (!((NSNull *)self.getInfoDict == [NSNull null])) {
//        
//        NSString *vipImageUrl = [CommonMethod paramStringIsNull:self.data[@"headimg_url"]];
//        if (vipImageUrl.length>0) {
//            [vipCell.vipImage setImageWithURL:[NSURL URLWithString:vipImageUrl]];
//        }
//        vipCell.nameLabel.text = [CommonMethod paramStringIsNull:self.getInfoDict[@"user_name"]];
//        vipCell.phoneLabel.text = [CommonMethod paramStringIsNull:self.getInfoDict[@"user_telephone"]];
//    }
//    
//    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//    [vipCell.vipImage  addGestureRecognizer:tapGes];
//    vipCell.vipImage.userInteractionEnabled = YES;
//    
    
    
    return vipCell;
    
}

- (UITableViewCell *)drawOperationCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier = @"operation_cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil]firstObject];
        
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"认证信息";
            cell.titleImage.image = [UIImage imageNamed:@"more_authentication"];
        }
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"修改密码";
            cell.titleImage.image = [UIImage imageNamed:@"more_changePassword"];
        }
        
    }
    
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"招募合伙人";
            cell.titleImage.image = [UIImage imageNamed:@"more_changeshare"];
        }
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"建议和技术支持";
            cell.titleImage.image = [UIImage imageNamed:@"more_advice"];
        }
    }
    
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"产品介绍";
            cell.titleImage.image = [UIImage imageNamed:@"more_product"];
        }
    }
    
    
    cell.titleLabel.font = [UIFont systemFontOfSize:14];
    cell.rightImageView.image = [UIImage imageNamed:@"right.png"];
    
    return cell;
}

- (UITableViewCell *)drawLogoutCell:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *kCellIdentifier = @"operation_cell";
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil]firstObject];
        
    }
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, kScreenSizeWidth, 44);
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"注销" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[MyCorlor colorWithHexString:@"ed0593"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(logoutButton) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 3;
    btn.clipsToBounds = YES;
    
    [cell addSubview:btn];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0:{
//                PersonalCertifyViewController *personVC = [[PersonalCertifyViewController alloc]init];
//                personVC.realName = vipCell.nameLabel.text;
//                //personVC.getInfoDict = self.getInfoDict;
//                [self.navigationController pushViewController:personVC animated:YES];
            }
                
                break;
            case 1:
            {
                
//                ChangePassWordViewController * changeVC = [[ChangePassWordViewController alloc]init];
//                [self.navigationController pushViewController:changeVC animated:YES];
                
            }
                break;
                
            default:
                break;
        }
        
        
        
    }else if (indexPath.section==2){
        switch (indexPath.row) {
            case 0:{
//                NSString *urlString = [CustomerAPI urlForConscribePartner];//招募合伙人
//                
//                WebBaseViewController * tvc = [[WebBaseViewController alloc]initWithUrlPath:urlString];
//                tvc.itemTitle = @"招募合伙人";//临时的，当页面url有的时候是获取的webView的url
//                [self.navigationController pushViewController:tvc animated:YES];
            }
                
                break;
            case 1:
            {
                
                WebBaseViewController * tvc = [[WebBaseViewController alloc]initWithUrlPath:@"http://www.yuangongdian.com/support.html"];
                //tvc.title = @"建议和技术支持";//临时的，当页面url有的时候是获取的webView的url
                [self.navigationController pushViewController:tvc animated:YES];
                
            }
                break;
                
            default:
                break;
        }
        
    }else if (indexPath.section == 3){
        
        NSLog(@"http://www.epub360.com/manage/book/5ptklr");//产品介绍
        WebBaseViewController * tvc = [[WebBaseViewController alloc]initWithUrlPath:@"http://www.epub360.com/manage/book/5ptklr"];
        //tvc.itemTitle = @"产品介绍";//临时的，当页面url有的时候是获取的webView的url
        [self.navigationController pushViewController:tvc animated:YES];
        
    }

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return 70.f;
    }
    return ROWHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section ==3) {
        return 44.f;
    }
    return 0.1;
}


#pragma mark - 退出登录

- (void)logoutButton{
    NSLog(@"退出登录");
}

@end
