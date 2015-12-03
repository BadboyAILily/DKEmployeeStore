//
//  ModuleCell.m
//  EmployeeStore
//
//  Created by 邓康 on 15/12/2.
//  Copyright © 2015年 Dkang. All rights reserved.
//

#import "ModuleCell.h"

@implementation ModuleCell

- (void)awakeFromNib {
    // Initialization code
    self.bottomLineHeight.constant = 0.4;
    self.moduleButtonArr = @[self.productButton,self.activityButton,self.companyButton,self.managerButton,self.accountButton,self.myOrderButton];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
