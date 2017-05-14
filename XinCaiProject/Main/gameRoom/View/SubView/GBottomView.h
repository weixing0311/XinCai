//
//  GBottomView.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//-----------最下面 筹码条view

#import <UIKit/UIKit.h>
typedef void(^cmChangeBlock) (UIButton *btn);
@interface GBottomView : UIView
@property (nonatomic , strong) UILabel  * moneyLb;//金币lb
@property (nonatomic , strong) UIButton * topUpBtn;//充值
@property (nonatomic , strong) UIButton * questionBtn;//?BTN
@property (nonatomic , strong) UIButton * personBtn;
@property (nonatomic , strong) cmChangeBlock didCMChangBlock;
-(void)refreshInfo;
-(void)didChangeCMBlock:(cmChangeBlock)changeCmBlock;
@end
