//
//  AppDelegate.h
//  XinCaiProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UMSocial.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialQQHandler.h>
#import <UMSocialSinaHandler.h>
#import <UMSocialSinaSSOHandler.h>
#import "LogInViewController.h"
#import "HomeViewController.h"
#import "JSPatchHelper.h"
#import "AdvertiseHelper.h"
#import "MPHomeViewController.h"
#import "DrawerViewController.h"
#import "SYSafeCategory.h"
#import "introductoryPagesHelper.h"
#import "iflyMSC/IFlyFaceSDK.h"

#import "MPAllModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;

//登录页面
-(void)setupLoginViewController;
//跳转到首页
-(void)setupHomeViewController;
@end

