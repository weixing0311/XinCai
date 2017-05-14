//
//  DrawerViewController.h
//  DrawerViewController
//
//  Created by 王博然 on 16/10/17.
//  Copyright © 2016年 zhipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawerViewController : UIViewController
/**
 *  抽屉占屏幕宽度的比例，0~1
 */
@property (assign , nonatomic) CGFloat drawerWidthScale;
/**
 *  tableView的headerView
 */
@property (strong , nonatomic) UIView * tableViewHeaderView;
/**
 *  tableView的footerView
 */
@property (strong , nonatomic) UIView * tableViewFooterView;
/**
 *  headerView的高度
 */
@property (assign , nonatomic) CGFloat headerViewHeight;
/**
 *  footerView的高度
 */
@property (assign , nonatomic) CGFloat footerViewHeight;
/**
 *  是否启用平移手势，默认不开启
 */
@property (assign , nonatomic) BOOL startGesture;
/**
 *  子视图控制器滑动时候的透明度
 */
@property (assign , nonatomic) CGFloat transparentScale;
/**
 *  单例获取，全局唯一
 *
 *  @return 返回唯一实例对象
 */
+ (DrawerViewController *)shareDrawer;
/**
 *  设置tableView的尾视图
 *
 *  @param headerView   尾视图view
 *  @param headerHeight 尾视图高度
 */
- (void)setFooterView : (UIView *)footerView
         FooterHeight : (CGFloat)footerHeight;
/**
 *  设置tableView的头视图
 *
 *  @param headerView   头视图view
 *  @param headerHeight 头视图高度
 */
- (void)setHeaderView : (UIView *)headerView
         HeaderHeight : (CGFloat)headerHeight;
/**
 *  添加子视图控制器
 *
 *  @param vc    添加的视图
 */
- (void)addSubViewControllerWithVC : (UIViewController *)vc;
/**
 *  添加子视图控制器
 *
 *  @param vc      添加的视图
 *  @param title   添加视图的文字描述
 *  @param image   添加视图前面的图片，可以是空。
 *  @param isRoot  添加的vc是否是第一个显示的，如果没有使用这个方法，默认会显示添加的第一个。
 */
- (void)addSubViewControllerWithVC : (UIViewController *)vc
                             Title : (NSString *)title
                             Image : (NSString *)image
                            IsRoot : (BOOL)isRoot;
/**
 *  显示
 */
- (void)showDrawer;
/**
 *  隐藏
 */
- (void)dismissDrawer;
/**
 *  返回当前正在显示的ViewController，也可能是Nav也可能是Tab也可能是VC看传来的是什么
 *
 *  @return 当前你正在显示的ViewController
 */
+ (UIViewController *)returnShowViewController;
@end
