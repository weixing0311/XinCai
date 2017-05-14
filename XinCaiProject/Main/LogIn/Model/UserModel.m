//
//  UserModel.m
//  XinCaiProject
//
//  Created by Gavin.Guo on 2017/4/13.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "UserModel.h"

static UserModel *shareModel;

@implementation UserModel

+ (UserModel *)shareModel
{
    if (shareModel==nil) {
        shareModel=[[super allocWithZone:NULL] init];
    }
    return shareModel;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareModel];
}

@end
