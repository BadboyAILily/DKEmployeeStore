//
//  StoreInfoCell.m
//  EmployeeStore
//
//  Created by 邓康 on 15/12/2.
//  Copyright © 2015年 Dkang. All rights reserved.
//

#import "StoreInfoCell.h"
#import "MyCorlor.h"

@implementation StoreInfoCell

- (void)awakeFromNib {
    // Initialization code
    self.bottomLineHeight.constant = 0.4;
//    self.cellContentView.backgroundColor = [UIColor lightGrayColor];
//    self.cellContentView.backgroundColor = [MyCorlor colorWithHexString:@"#000000"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
