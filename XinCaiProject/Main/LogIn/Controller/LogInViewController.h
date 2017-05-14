//
//  LogInViewController.h
//  XinCaiProject 登录
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LogInApi.h"
#import "LoginModel.h"

#import "UMengSocialLoginViewController.h"
#import "UMengSocialViewController.h"
#import "LoggerViewController.h"
#import "JSPatchViewController.h"

@interface LogInViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *accountTf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTf;
- (IBAction)forgetPassword:(id)sender;

- (IBAction)didmobileLoign:(id)sender;//手机号登录
- (IBAction)touristsLoign:(id)sender;//游客登录
- (IBAction)didresign:(id)sender;//注册
@property (weak, nonatomic) IBOutlet UIButton *loignBtn;
@property (weak, nonatomic) IBOutlet UIButton *resignBtn;
@property (weak, nonatomic) IBOutlet UIButton *touristsLoignBtn;
@end

