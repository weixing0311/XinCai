//
//  ResignApi.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "ResignApi.h"

@implementation ResignApi
{
    NSDictionary *dic;
}
- (id)initWithParam:(NSDictionary *)param {
    self = [super init];
    if (self) {
        dic = [NSDictionary dictionaryWithDictionary:param];
    }
    return self;
}

- (NSString *)requestUrl {
    return @"2001";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

-(SERVERCENTER_TYPE)centerType
{
    return ACCOUNT_SERVERCENTER;
}

- (id)requestArgument {
    return dic;
}
@end
