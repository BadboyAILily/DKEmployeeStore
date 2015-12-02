//
//  SetVipInfoCell.h
//  Customer
//
//  Created by Zerlinda on 15/6/10.
//  Copyright (c) 2015年 com.jit. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol upLoadPicture <NSObject>

- (void)upLoadPicture;


@end


@interface SetVipInfoCell : UITableViewCell


@property (retain, nonatomic) IBOutlet UIImageView *vipImage;

@property (retain, nonatomic) IBOutlet UILabel *vipName;

@property (retain, nonatomic) IBOutlet UILabel *vipNum;

@property (assign, nonatomic)id<upLoadPicture> delegate;

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;

@property (retain, nonatomic) IBOutlet UILabel *phoneLabel;

@end
