//
//  StoreInfoCell.h
//  EmployeeStore
//
//  Created by 邓康 on 15/12/2.
//  Copyright © 2015年 Dkang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *storeAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIView *cellContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineHeight;

@end
