//
//  UIButton+Custom.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Custom)
/*
 * 设置圆角
 * view-
 * radius 角度
 * color  边线颜色
 */
-(void)didRadiusWithRadius:(float)radius borderColor:(UIColor*)color;
@end
