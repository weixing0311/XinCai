//
//  HomeClassificationService.m
//  XinCaiProject
//
//  Created by SUperView on 2017/5/8.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "HomeClassificationService.h"

@implementation HomeClassificationService
- (id)initWithmobileNum:(NSString *)mobilenum {
    self = [super init];
    if (self) {
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
   // return @{@"mobile": _mobileNum,@"type": @"0"};
    return nil;
}

@end
