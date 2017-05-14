//
//  AppDelegate.m
//  XinCaiProject
//
//  Created by wujunyang on 16/1/5.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "AppDelegate.h"
#import "YTKNetworkConfig.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //热更新加载
    [JSPatchHelper HSDevaluateScript];
    
    //科大讯飞 配置文件
    [self makeConfiguration];
    
    //统一处理一些为数组、集合等对nil插入会引起闪退
    [SYSafeCategory callSafeCategory];
    
    /* 自添加 */
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    //键盘统一收回处理
    [self configureBoardManager];
    
    //加载页面
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self setupLoginViewController];
    
    //引导页面加载
    [self setupIntroductoryPage];
    
    //启动广告（记得放最后，才可以盖在页面上面）
    [self setupAdveriseView];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 启动广告
-(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}


#pragma mark 引导页
-(void)setupIntroductoryPage
{
    if (BBUserDefault.isNoFirstLaunch)
    {
        return;
    }
    BBUserDefault.isNoFirstLaunch=YES;
    NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
    [introductoryPagesHelper showIntroductoryPageView:images];
}

#pragma mark 键盘收回管理
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
}

#pragma mark 自定义跳转不同的页面
//登录页面
-(void)setupLoginViewController
{
    LogInViewController *logInVc = [[LogInViewController alloc]init];
    self.window.rootViewController = logInVc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

//首页
-(void)setupHomeViewController
{
    DrawerViewController *drawerVC = [DrawerViewController shareDrawer];
    drawerVC.tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    drawerVC.headerViewHeight    = 20;
    HomeViewController * vc1 = [HomeViewController new];
    vc1.view.backgroundColor = [UIColor whiteColor];
    HomeViewController * vc2 = [HomeViewController new];
    vc2.view.backgroundColor = [UIColor blackColor];
    HomeViewController * vc3 = [HomeViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    [nav1.navigationBar setBarTintColor:[UIColor redColor]];
    [nav1.navigationBar setTintColor:[UIColor purpleColor]];
    nav1.navigationBar.translucent = NO;
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    [nav2.navigationBar setBackgroundColor:[UIColor yellowColor]];
    nav2.navigationBar.translucent = NO;
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    [nav3.navigationBar setBackgroundColor:[UIColor blueColor]];
    nav3.navigationBar.translucent = NO;
    [drawerVC addSubViewControllerWithVC:nav1];
    [drawerVC addSubViewControllerWithVC:nav2];
    [drawerVC addSubViewControllerWithVC:nav3];
    
//    MPHomeViewController *tabBarController = [[MPHomeViewController alloc] init];
//    [self.window setRootViewController:tabBarController];
    [self.window setRootViewController:drawerVC];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}







#pragma mark - APP运行中接收到通知(推送)处理

/**IOS7 APP已经接收到“远程”通知(推送) - (App运行在后台) 当不走个推时，从苹果进来执行，获得userInfo里面的属性*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    //处理applicationIconBadgeNumber-1
    //[self handlePushMessage:userInfo notification:nil];
    
    //除了个推还要处理走苹果的信息放在body里面
    if (userInfo) {
        NSString *payloadMsg = [userInfo objectForKey:@"payload"];
        NSString *message=[[[userInfo objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您有一条新消息" message:[NSString stringWithFormat:@"%@,%@",payloadMsg,message] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        NSLog(@"%@",userInfo);
    }
    NSLog(@"\n>>>[Receive RemoteNotification]:%@\n\n", userInfo);
}

/**IOS7以后 APP已经接收到“远程”通知(推送) - 透传推送消息  当不走个推时，从苹果进来执行，获得userInfo里面的属性*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
    //处理applicationIconBadgeNumber-1
    //[self handlePushMessage:userInfo notification:nil];
    
    //除了个推还要处理走苹果的信息放在body里面
    if (userInfo) {
        NSString *payloadMsg = [userInfo objectForKey:@"payload"];
        NSString *message=[[[userInfo objectForKey:@"aps"]objectForKey:@"alert"]objectForKey:@"body"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您有一条新消息" message:[NSString stringWithFormat:@"%@,%@",payloadMsg,message] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        NSLog(@"%@",userInfo);
    }
    // 处理APN
    NSLog(@"\n>>>[Receive RemoteNotification - Background Fetch]:%@\n\n", userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
}

// 处理推送消息
- (void)handlePushMessage:(NSDictionary *)dict notification:(UILocalNotification *)localNotification {
    NSLog(@"开始处理从通知栏点击进来的推送消息");
    
    if ([UIApplication sharedApplication].applicationIconBadgeNumber != 0) {
        if (localNotification) {
            [[UIApplication sharedApplication] cancelLocalNotification:localNotification];
        }
        [UIApplication sharedApplication].applicationIconBadgeNumber -= 1;
    }
    else {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    }
}

/** SDK收到透传消息回调 */
- (void)GeTuiSdkDidReceivePayloadData:(NSData *)payloadData andTaskId:(NSString *)taskId andMsgId:(NSString *)msgId andOffLine:(BOOL)offLine fromGtAppId:(NSString *)appId {
    
    [self handlePushMessage:nil notification:nil];
    // [4]: 收到个推消息
    // 数据转换
    NSString *payloadMsg = nil;
    if (payloadData) {
        payloadMsg = [[NSString alloc] initWithBytes:payloadData.bytes length:payloadData.length encoding:NSUTF8StringEncoding];
    }
    
    // 控制台打印日志
    NSString *msg = [NSString stringWithFormat:@"taskId=%@,messageId:%@,payloadMsg:%@%@", taskId, msgId, payloadMsg, offLine ? @"<离线消息>" : @""];
    NSLog(@"\n>>[GTSdk ReceivePayload]:%@\n\n", msg);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"您有一条新消息，走个推" message:msg delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
    NSLog(@"\n>>>[GexinSdk ReceivePayload]:%@\n\n", msg);
}






- (void)applicationDidBecomeActive:(UIApplication *)application
{

    //热更新JS文件下载 最好做一个时间限制 比如隔多久进行下载(间隔一小时)
    [JSPatchHelper loadJSPatch];
}

#pragma mark --- 配置文件
-(void)makeConfiguration
{
    //设置log等级，此处log为默认在app沙盒目录下的msc.log文件
    [IFlySetting setLogFile:LVL_ALL];
    
    //输出在console的log开关
    [IFlySetting showLogcat:YES];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    //设置msc.log的保存路径
    [IFlySetting setLogFilePath:cachePath];
    
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@,",USER_APPID];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
}





@end
