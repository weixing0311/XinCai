//
//  Cm_animation.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/11.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cm_animation : NSObject
+(Cm_animation*)instence;
/*
 
 根据点击不同的筹码获取筹码的面值
 */

-(void)getCMFaceValueWithTag:(NSInteger)theTag;
/*
 
 根据点击不同的门 获取门位置
 */
-(CGRect)getLocationWithView:(UIView *)view;
/*
 根据门位置 筹码飞起
 */
-(void)changeViewLocationWithView:(UIView *)view location:(CGRect)rect;
/*
 返回筹码image
 */
-(UIImage*)returnCMFaceValue;
@end
