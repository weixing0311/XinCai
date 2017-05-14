//
//  DrawerViewController.m
//  DrawerViewController
//
//  Created by 王博然 on 16/10/17.
//  Copyright © 2016年 zhipeng. All rights reserved.
//

#import "DrawerViewController.h"
#import "DrawerCell.h"

#import "DrawerUserInfoCell.h"
#import "DrawerBetInfoCell.h"
#import "DrawerMenuCell.h"

#define kMainBouns [UIScreen mainScreen].bounds
@interface DrawerViewController () <UITableViewDelegate ,UITableViewDataSource>
@property (strong , nonatomic) NSArray * titleArray;
@property (strong , nonatomic) NSArray * cellHeightArray;
@property (strong , nonatomic) NSMutableArray * vcArray;
/**
 *  存的控制器
 */
@property (strong , nonatomic) UINavigationController * vc;
/**
 *  tableView用于选择
 */
@property (strong , nonatomic) UITableView * tableView;
/**
 *  tapGesture
 */
@property (strong , nonatomic) UITapGestureRecognizer * tapGesture;
/**
 *  rightPanGesture
 */
@property (strong , nonatomic) UIPanGestureRecognizer * rightPanGesture;
/**
 *  rootVC在数组中的位置。
 */
@property (assign , nonatomic) NSInteger rootIndex;
/**
 *  点击的遮挡视图。
 */
@property (strong , nonatomic) UIView * tapView;
@property (assign , nonatomic) CGFloat drawerWidth;
@end
static DrawerViewController * drawerVC;
@implementation DrawerViewController
+ (instancetype)new
{
    return [self shareDrawer];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.drawerWidthScale = 0.8;
        self.drawerWidth      = [UIScreen mainScreen].bounds.size.width * self.drawerWidthScale;
        self.startGesture     = NO;
        self.tapGesture       = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDismiss)];
        self.rootIndex        = 0;
        self.rightPanGesture  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rightPanAction:)];
        self.transparentScale = 0.2;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    self.navigationController.navigationBar.translucent = NO;
    [self configDataArray];
    [self configTableViewCell];
    [self.view addSubview:self.tableView];
    [self changeViewControllerWithNumber:self.rootIndex];
}

- (void)configTableViewCell{
    [_tableView registerNib:[UINib nibWithNibName:@"DrawerUserInfoCell" bundle:nil] forCellReuseIdentifier:@"DrawerUserInfoCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DrawerBetInfoCell" bundle:nil] forCellReuseIdentifier:@"DrawerBetInfoCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DrawerMenuCell" bundle:nil] forCellReuseIdentifier:@"DrawerMenuCell"];
}

- (void)configDataArray{
    //  1.用户信息 & 金币情况  2.投注情况  3.消息  4.联系客服  5.退出登录
    self.titleArray = @[@"用户信息 & 金币情况",@"投注情况",@"消息",@"联系客服",@"退出登录"];
    self.cellHeightArray = @[@306,@230,@40,@40,@40];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----- 重写set方法 -----
- (void)setTableViewFooterView:(UIView *)tableViewFooterView
{
    if (_tableViewFooterView != tableViewFooterView) {
        _tableViewFooterView  = tableViewFooterView;
    }
}
- (void)setTableViewHeaderView:(UIView *)tableViewHeaderView
{
    if (_tableViewHeaderView != tableViewHeaderView) {
        _tableViewHeaderView  = tableViewHeaderView;
    }
}
- (void)setDrawerWidth:(CGFloat)drawerWidth
{
    if (_drawerWidth != drawerWidth) {
        _drawerWidth         = drawerWidth;
        self.tableView.frame = CGRectMake(-(self.drawerWidth / 2.0), 0, self.drawerWidth, kMainBouns.size.height);
    }
}
- (void)setDrawerWidthScale:(CGFloat)drawerWidthScale
{
    if (_drawerWidthScale != drawerWidthScale) {
        _drawerWidthScale    = drawerWidthScale;
        self.drawerWidth     = [UIScreen mainScreen].bounds.size.width * drawerWidthScale;
        self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.drawerWidth, self.tableView.frame.size.height);
    }
}
#pragma mark ----- 懒加载 -----
- (UIView *)tapView
{
    if (_tapView == nil) {
        _tapView = [[UIView alloc] init];
        [_tapView addGestureRecognizer:self.tapGesture];
        _tapView.userInteractionEnabled = NO;
    }
    return _tapView;
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(-(self.drawerWidth / 2.0), 0, self.drawerWidth, kMainBouns.size.height) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setBackgroundColor:[UIColor purpleColor]];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (NSArray *)titleArray
{
    if (_titleArray == nil) {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}
- (NSMutableArray *)vcArray
{
    if (_vcArray == nil) {
        _vcArray = [NSMutableArray array];
    }
    return _vcArray;
}
- (NSArray *)cellHeightArray
{
    if (_cellHeightArray == nil) {
        _cellHeightArray = [NSArray array];
    }
    return _cellHeightArray;
}
#pragma mark ----- tableView -----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cellHeightArray[indexPath.row] floatValue];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            DrawerUserInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerUserInfoCell" forIndexPath:indexPath];
            return cell;
        }
            break;
        case 1:
        {
            DrawerBetInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerBetInfoCell" forIndexPath:indexPath];
            return cell;
        }
            break;
        case 2:
        {
            DrawerMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerMenuCell" forIndexPath:indexPath];
            cell.title = self.titleArray[indexPath.row];
            return cell;
        }
            break;
        case 3:
        {
            DrawerMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerMenuCell" forIndexPath:indexPath];
            cell.title = self.titleArray[indexPath.row];
            return cell;
        }
            break;
        case 4:
        {
            DrawerMenuCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerMenuCell" forIndexPath:indexPath];
            cell.title = self.titleArray[indexPath.row];
            return cell;
        }
            break;
        default:
            return nil;
            break;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.vc isEqual:self.vcArray[indexPath.row]]) {
        [self dismissDrawer];
        return;
    }
    [self changeViewControllerWithNumber:indexPath.row];
    [self dismissDrawer];
}
//  1.用户信息 & 金币情况  2.投注情况  3.消息  4.联系客服  5.退出登录
//    DrawerCell * cell = [tableView dequeueReusableCellWithIdentifier:@"DrawerCell" forIndexPath:indexPath];
//    cell.title     = _titleArray[indexPath.row];
//    cell.imageName = _imageArray[indexPath.row];
//    return cell;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
#pragma mark ----- 实现方法 -----
+ (DrawerViewController *)shareDrawer
{
    if (drawerVC == nil) {
        drawerVC = [[DrawerViewController alloc] init];
    }
    return drawerVC;
}
- (void)setHeaderView : (UIView *)headerView
         HeaderHeight : (CGFloat)headerHeight
{
    self.headerViewHeight    = headerHeight;
//    self.tableView.tableHeaderView = headerView;
    self.tableViewHeaderView = headerView;
    [self.tableView reloadData];
}
- (void)setFooterView : (UIView *)footerView
         FooterHeight : (CGFloat)footerHeight
{
    self.footerViewHeight    = footerHeight;
//    self.tableView.tableFooterView = footerView;
    self.tableViewFooterView = footerView;
    [self.tableView reloadData];
}
/**
 *  切换到第几个视图控制器 0 ~ n
 *
 *  @param number 数值 0 ~ n
 */
- (void)changeViewControllerWithNumber : (NSInteger)number
{
    CGRect rect = [UIScreen mainScreen].bounds;
    if (self.vc) {
        [self.vc.view removeFromSuperview];
        rect = self.vc.view.frame;
        [self.tapView removeFromSuperview];
    }
    self.vc = self.vcArray[number];
    self.vc.view.frame = rect;
    if ([self.vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController * nav  = self.vc;
        if (nav.viewControllers.count == 1) {
            UIViewController * vc1    = nav.viewControllers.firstObject;
            [vc1.view addGestureRecognizer:self.rightPanGesture];
        }
    }
    self.tapView.frame = self.vc.view.bounds;
    [self.vc.view addSubview:self.tapView];
    [self.view    addSubview:self.vc.view];
}
/**
 *  添加子视图控制器
 *
 *  @param vc    添加的视图
 */
- (void)addSubViewControllerWithVC:(UIViewController *)vc
{
    [self.vcArray    addObject:vc];
    [self.tableView  reloadData];
    [self addChildViewController:vc];
    
}
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
                            IsRoot : (BOOL)isRoot
{
    [self addSubViewControllerWithVC:vc];
    if (isRoot) {
        self.rootIndex = self.vcArray.count - 1;
    }
}
/**
 *  显示
 */
- (void)showDrawer
{
    [self.vc.view layoutIfNeeded];
    [self.tableView layoutIfNeeded];
    self.tapView.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.25 animations:^{
        self.vc.view.frame           = CGRectMake(self.drawerWidth, self.vc.view.frame.origin.y, self.vc.view.frame.size.width, self.vc.view.frame.size.height);
        self.tableView.frame         = CGRectMake(0, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height);
        self.tapView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:self.transparentScale];
    } completion:^(BOOL finished) {
        self.tapView.userInteractionEnabled = YES;
        [self.tapView addGestureRecognizer:self.rightPanGesture];
    }];
}
/**
 *  隐藏
 */
- (void)dismissDrawer
{
    [self.vc.view layoutIfNeeded];
    [self.tableView layoutIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        self.vc.view.frame = CGRectMake(0, self.vc.view.frame.origin.y, self.vc.view.frame.size.width, self.vc.view.frame.size.height);
        self.tableView.frame = CGRectMake(- (self.drawerWidth / 2.0), self.tableView.frame.origin.y, self.tableView.frame.size.width, self.tableView.frame.size.height);
        self.tapView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        [self.tapView removeGestureRecognizer:self.rightPanGesture];
        [self.vc.view removeGestureRecognizer:self.tapGesture];
        self.tapView.userInteractionEnabled = NO;
        if ([self.vc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = self.vc;
            if (nav.viewControllers.count == 1) {
                UIViewController * vc1 = nav.viewControllers.firstObject;
                [vc1.view addGestureRecognizer:self.rightPanGesture];
            }
        }else{
            [self.vc.view addGestureRecognizer:self.rightPanGesture];
        }
        
        
    }];
}
#pragma mark ----- 手势方法 -----
- (void)tapDismiss
{
    [self dismissDrawer];
}
- (void)rightPanAction : (UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan locationInView:self.vc.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    if (point.x > [UIScreen mainScreen].bounds.size.width - self.drawerWidth) {
        if (self.vc.view.frame.origin.x != 0) {
            if (self.vc.view.frame.origin.x >= self.drawerWidth / 2.0) {
                [self showDrawer];
            }else{
                [self dismissDrawer];
            }
        }
        return;
    }

    if (pan.state == UIGestureRecognizerStateChanged) {
        //得到需要移动的view
        UIView *view = self.vc.view;
        //得到我们在视图上移动的偏移量
        CGPoint currentPoint = [pan translationInView:view.superview];
        //    NSLog(@"%@",NSStringFromCGPoint(currentPoint));
        if ((view.frame.origin.x + currentPoint.x) < 0 || (view.frame.origin.x + currentPoint.x) > (self.drawerWidth)) {
            return;
        }
        //通过2D仿射变换函数中与位移有关的函数实现视图位置变化
        view.transform = CGAffineTransformTranslate(view.transform, currentPoint.x, 0);
        self.tableView.transform = CGAffineTransformTranslate(self.tableView.transform, currentPoint.x / 2.0, 0);
        /**
         *  渐变动画
         */
        self.tapView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:self.transparentScale * ( view.frame.origin.x / self.drawerWidth)];
        //复原 // 每次都是从00点开始
        [pan setTranslation:CGPointZero inView:view.superview];
    }else{
        if (self.vc.view.frame.origin.x >= self.drawerWidth / 2.0) {
            [self showDrawer];
        }else{
            [self dismissDrawer];
        }
        return;
    }
}
+ (UIViewController *)returnShowViewController
{
    if ([[self shareDrawer].vc isKindOfClass:[UINavigationController class]]) {
        UINavigationController * nav = [self shareDrawer].vc;
        return nav.viewControllers.lastObject;
    }else{
        return [self shareDrawer].vc;
    }
}
@end
