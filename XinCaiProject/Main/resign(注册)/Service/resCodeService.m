//
//  resCodeService.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "resCodeService.h"
@interface resCodeService()
{
    NSString * _mobileNum;
}
@end


@implementation resCodeService

- (id)initWithmobileNum:(NSString *)mobilenum {
    self = [super init];
    if (self) {
        _mobileNum = mobilenum;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"2007";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

-(SERVERCENTER_TYPE)centerType
{
    return ACCOUNT_SERVERCENTER;
}

- (id)requestArgument {
    return @{
             @"mobile": _mobileNum,
             @"type": @"0"
             };
}

@end
