//
//  ModuleCell.h
//  EmployeeStore
//
//  Created by 邓康 on 15/12/2.
//  Copyright © 2015年 Dkang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModuleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineHeight;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *activityImage;
@property (weak, nonatomic) IBOutlet UIImageView *companyImage;
@property (weak, nonatomic) IBOutlet UIImageView *manageImage;
@property (weak, nonatomic) IBOutlet UIImageView *accountImage;
@property (weak, nonatomic) IBOutlet UILabel *myOrderImage;

@property (weak, nonatomic) IBOutlet UIButton *productButton;

@property (weak, nonatomic) IBOutlet UIButton *activityButton;

@property (weak, nonatomic) IBOutlet UIButton *companyButton;
@property (weak, nonatomic) IBOutlet UIButton *managerButton;
@property (weak, nonatomic) IBOutlet UIButton *accountButton;
@property (weak, nonatomic) IBOutlet UIButton *myOrderButton;

@property (nonatomic,retain)NSArray *moduleButtonArr;

@end
