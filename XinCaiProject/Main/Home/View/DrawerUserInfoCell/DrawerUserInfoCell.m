//
//  DrawerUserInfoCell.m
//  XinCaiProject
//
//  Created by Gavin.Guo on 2017/3/27.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "DrawerUserInfoCell.h"

@interface DrawerUserInfoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iConImageView;
@property (weak, nonatomic) IBOutlet UIImageView *nickNameImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userMobileLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocalCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *todayMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *balanceMoneyLabel;

@end

@implementation DrawerUserInfoCell

-(void)setUserModel:(UserModel *)userModel{
    //  设置头像
    [self.iConImageView sd_setImageWithURL:[NSURL URLWithString:userModel.image] placeholderImage:[UIImage imageNamed:@""]];
    //  设置昵称
    self.nickNameLabel.text = userModel.nickName;
    //  设置手机号
    self.userMobileLabel.text = userModel.phoneNumber;
    //  设置所属地区
    self.userLocalCityLabel.text = userModel.localCity;
    //  设置今日盈亏
    self.todayMoneyLabel.text = userModel.todayMoney;
    //  设置金币余额
    self.balanceMoneyLabel.text = userModel.balanceMoney;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.iConImageView.layer.cornerRadius = 58.0f;
    self.iConImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
