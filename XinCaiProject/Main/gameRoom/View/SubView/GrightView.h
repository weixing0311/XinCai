//
//  GrightView.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//-----游戏页面右侧上庄+上庄人

#import <UIKit/UIKit.h>

@interface GrightView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView * tableView;
@property (nonatomic , strong) UIButton * szBtn;//上庄BUTTON
@property (nonatomic , strong) UILabel  *countDownLb;//倒计时LB

/*
 *reloaddata  刷新上庄人员数据
 *INfo： 数据
 
 */
-(void)reloadDataWithInfo:(NSMutableArray *)info;

/*
 
 倒计时 更新lb内容
 
 */
-(void)startCountDown:(NSString *)str;
@end
