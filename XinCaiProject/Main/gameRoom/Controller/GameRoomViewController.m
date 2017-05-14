//
//  GameRoomViewController.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/8.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GameRoomViewController.h"
#import "GAnimationView.h"
#import "GrightView.h"
#import "GBottomView.h"
#import "GGetZhuangView.h"
#import "GContinuousView.h"
#import "GMenuView.h"
#import "GTheBarView.h"
#import "Cm_animation.h"
@interface GameRoomViewController ()
{
    GAnimationView  * _animationView;  //动画页面
    GrightView      * _rightView;      //动画右面的上庄页面
    GTheBarView     * _theBarView;     //主台页面
    GMenuView       * _menuView;       //菜单页面
    GGetZhuangView  * _getZhuangView;  //上庄页面
    GContinuousView * _continuousView; //连庄页面
    GBottomView     * _bottomView;     //最下面筹码页面
    NSString        * _didClickCm;     //点击最下面的筹码面值
}
@end

@implementation GameRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self buildSubView];
    
}
#pragma mark --创建页面↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
//主页面
-(void)buildSubView
{
    
    float bili = GetViewWidth(self.view)/375.0f;
    float height = 0.0f;
    _animationView = [[GAnimationView alloc]initWithFrame:CGRectMake(0, 0, 275*bili, GetViewHeight(self.view)*0.27)];
    [self.view addSubview:_animationView];
    
    _rightView = [[GrightView alloc]initWithFrame:CGRectMake(275*bili, 0, GetViewWidth(self.view)-275*bili, GetViewHeight(self.view)*0.27)];
    [self.view addSubview:_rightView];

    height += GetViewHeight(self.view)*0.27;
    
    _theBarView = [[GTheBarView alloc]initWithFrame:CGRectMake(0, height,GetViewWidth(self.view), GetViewHeight(self.view)*0.5)];
    height += GetViewHeight(self.view)*0.5;
    _theBarView.backgroundColor = [UIColor greenColor];
    
    
    [_theBarView didMenBtnBlock:^(UIButton *button) {
        
        DDLogError(@"点击第几门%ld",(long)button.tag);
        UIImageView *imgView =[[UIImageView alloc]initWithFrame:CGRectMake(GetViewWidth(self.view), height, 20, 20)];
        imgView.image = [[Cm_animation instence]returnCMFaceValue];
        [self.view addSubview:imgView];
        UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
        CGRect rect=[button convertRect: button.bounds toView:window];
        rect.size.height = rect.size.height-TopBarHeight;
        [[Cm_animation instence]changeViewLocationWithView:imgView location:rect];
    }];
    [self.view addSubview:_theBarView];

    
    
    _bottomView = [[GBottomView alloc]initWithFrame:CGRectMake(0, height, GetViewWidth(self.view), GetViewHeight(self.view)-height)];
    _bottomView.backgroundColor = [UIColor purpleColor];
    
    [_bottomView didChangeCMBlock:^(UIButton *btn) {
        [[Cm_animation instence]getCMFaceValueWithTag:btn.tag];
    }];
    [self.view addSubview:_bottomView];

}
//弹出上庄页面
-(void)buildGetZhuangView
{
    if (!_getZhuangView) {
        _getZhuangView = [[GGetZhuangView alloc]init];
        [_getZhuangView setFrame: CGRectMake(0, 0, 0, 0)];
        [self.view.window addSubview:_getZhuangView];
    }

}
//弹出连庄页面
-(void)buildContinuousView
{
    if (!_continuousView) {
        _continuousView = [[GContinuousView alloc]initWithFrame:CGRectZero];
        [_continuousView setFrame: CGRectMake(0, 0, 0, 0)];
        [self.view.window addSubview:_continuousView];
    }
}
//弹出右侧浮动菜单页面
-(void)builMenuView
{
    if (!_menuView) {
        _menuView = [[GMenuView alloc]initWithFrame:CGRectZero];
        [_menuView setFrame: CGRectMake(0, 0, 0, 0)];
        [self.view addSubview:_menuView];
    }
}
#pragma  mark----创建页面↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --筹码动画





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
