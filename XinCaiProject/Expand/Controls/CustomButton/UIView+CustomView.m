//
//  UIView+CustomView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "UIView+CustomView.h"

@implementation UIView (CustomView)
-(void)didRadiusWithRadius:(float)radius borderColor:(UIColor*)color
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = color.CGColor;
    
}

@end
