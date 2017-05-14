//
//  GTheBarView.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//-------------绿色界面

#import <UIKit/UIKit.h>
typedef void(^TheMenButtonBlock)(UIButton *button);

@interface GTheBarView : UIView
//点击事件Block
@property(nonatomic,copy)TheMenButtonBlock MenBtnBlock;
-(void)didMenBtnBlock:(TheMenButtonBlock)menBntBlock;
@end
