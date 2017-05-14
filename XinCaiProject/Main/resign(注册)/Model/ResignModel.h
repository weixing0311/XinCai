//
//  ResignModel.h
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResignModel : NSObject
+(ResignModel*)defaultManager;
-(BOOL)isEmptyWithString:(NSString *)string;// 判断字符串为空
-(BOOL)valiMobile:(NSString *)mobile;//手机号正则
@end
