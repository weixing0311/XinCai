//
//  ResignModel.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "ResignModel.h"

@implementation ResignModel


+(ResignModel*)defaultManager
{
    static ResignModel *resignModelManager=nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        resignModelManager = [[ResignModel alloc]init];
    });
    return resignModelManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
//判断字段为空
-(BOOL)isEmptyWithString:(NSString *)string
{
    NSString *temp = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([temp length]!=0&&![string isEqualToString:@""]) {
        return YES;
    }else
        return NO;

}

//手机号正则表达式
- (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}
@end
