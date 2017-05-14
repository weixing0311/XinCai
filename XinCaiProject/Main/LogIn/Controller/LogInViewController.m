//
//  LogInViewController.m
//  XinCaiProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "LogInViewController.h"
#import "AppDelegate.h"
#import "ResignViewController.h"
#import "ForgetPasswordViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
  
    
    //测试日志
    DDLogError(@"测试 Error 信息");
    DDLogWarn(@"测试 Warn 信息");
    DDLogDebug(@"测试 Debug 信息");
    DDLogInfo(@"测试 Info 信息");
    DDLogVerbose(@"测试 Verbose 信息");
    
    
    //登录成功后跳转到首页
   // [((AppDelegate*) AppDelegateInstance) setupHomeViewController];
    
    
    
    //友盟第三方登录
//    UMengSocialLoginViewController *umLogin=[[UMengSocialLoginViewController alloc]init];
//    [self.navigationController pushViewController:umLogin animated:YES];
    
    //友盟分享跳转
//    UMengSocialViewController *um=[[UMengSocialViewController alloc]init];
//    [self.navigationController pushViewController:um animated:YES];
    
    //日志列表查看
//    LoggerViewController *lv=[[LoggerViewController alloc]init];
//    [self.navigationController pushViewController:lv animated:YES];
    
    [self didRadiusWithView:self.loignBtn radius:GetViewHeight(self.loignBtn)/2 borderColor:HEXCOLOR(0XD76ED0)];
    [self didRadiusWithView:self.resignBtn radius:GetViewHeight(self.resignBtn)/2 borderColor:[UIColor whiteColor]];
    [self didRadiusWithView:self.touristsLoignBtn radius:GetViewHeight(self.touristsLoignBtn)/2 borderColor:[UIColor whiteColor]];
    [self setColor];
}
//设置buttontitle颜色
-(void)setColor
{
    [self.loignBtn setTitleColor:HEXCOLOR(0xD76ED0) forState:UIControlStateNormal] ;
    [self.resignBtn setTitleColor:HEXCOLOR(0xD76ED0) forState:UIControlStateNormal];
    [self.touristsLoignBtn setTitleColor:HEXCOLOR(0xD76ED0) forState:UIControlStateNormal];
}
//设置圆角
-(void)didRadiusWithView:(UIView *)view radius:(float)radius borderColor:(UIColor*)color
{
    DDLogError(@"圆角%@",view);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = radius;
    view.layer.borderWidth = 2.0;
    view.layer.borderColor = color.CGColor;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)forgetPassword:(id)sender {
    ForgetPasswordViewController *forgetpsVC = [[ForgetPasswordViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:forgetpsVC];
    //nav.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:nav animated:YES completion:^{
        
    }];

}

- (IBAction)didmobileLoign:(id)sender {
    
    //    测试登录及网络请求
        LogInApi *reg = [[LogInApi alloc] initWithUsername:self.accountTf.text password:self.passwordTf.text];
        [reg startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            NSLog(@"状态码%ld",request.responseStatusCode);
            LoginModel *model=[[LoginModel alloc]initWithString:request.responseString error:nil];
            NSLog(@"响应内容:%@",model.access_token);
            //成功登录 跳转到首页
            [((AppDelegate*)AppDelegateInstance) setupHomeViewController];
    
        } failure:^(YTKBaseRequest *request) {
            NSLog(@"Error");
        }];

}

- (IBAction)touristsLoign:(id)sender {
    [((AppDelegate*) AppDelegateInstance) setupHomeViewController];
}
- (IBAction)didresign:(id)sender {
    ResignViewController *resignVC =[[ResignViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:resignVC];
    nav.title  = @"注册";
    nav.navigationBar.backIndicatorImage = GetImage(@"loignBG.png");
    [self presentViewController:nav animated:YES completion:^{
        
    }];
    
    
}
@end

