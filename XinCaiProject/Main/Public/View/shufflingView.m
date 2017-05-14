//
//  shufflingView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "shufflingView.h"

@implementation shufflingView
{
    UILabel *label;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        label = [[UILabel alloc]initWithFrame:CGRectMake(GetViewWidth(self), 0, frame.size.width-40, frame.size.height)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
//        label.text = title;
        [self addSubview:label];
    }
    return self;
}
-(void)setShufflingWithTitle:(NSString *)title
{
    label.text = title;
    [UIView animateWithDuration:14 animations:^{
        label.frame  =CGRectMake(20, 0, GetViewWidth(self)-40, GetViewHeight(self));
    }];
}
@end
