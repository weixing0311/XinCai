//
//  UIButton+Custom.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "UIButton+Custom.h"

@implementation UIButton (Custom)
-(void)didRadiusWithRadius:(float)radius borderColor:(UIColor*)color
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = color.CGColor;
    
}

@end
