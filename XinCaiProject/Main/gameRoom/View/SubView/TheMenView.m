//
//  TheMenView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/11.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "TheMenView.h"

@implementation TheMenView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:GetImage(@"smallGreenBG") forState:UIControlStateNormal];
    }
    return self;
}

@end
