//
//  UserModel.h
//  XinCaiProject
//
//  Created by Gavin.Guo on 2017/4/13.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/**
 头像
 */
@property (nonatomic, copy) NSString *image;

/**
 昵称
 */
@property (nonatomic, copy) NSString *nickName;

/**
 手机号
 */
@property (nonatomic, copy) NSString *phoneNumber;

/**
 所属区域
 */
@property (nonatomic, copy) NSString *localCity;

/**
 今日盈亏
 */
@property (nonatomic, copy) NSString *todayMoney;

/**
 金币余额
 */
@property (nonatomic, copy) NSString *balanceMoney;

/**
 投注明细
 */
@property (nonatomic, copy) NSArray *betInfoList;

+ (UserModel *)shareModel;

@end
