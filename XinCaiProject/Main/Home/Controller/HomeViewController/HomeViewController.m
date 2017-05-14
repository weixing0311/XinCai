//
//  ViewController.m
//  DrawerViewController
//
//  Created by zhipeng on 16/10/17.
//  Copyright © 2016年 zhipeng. All rights reserved.
//

#import "HomeViewController.h"
#import "DrawerViewController.h"
#import "GeneralLedgerView.h"
#import "HomeViewTableViewCell.h"
#import "HomeViewService.h"
#import "GameContetnTableViewController.h"
#import "shufflingView.h"
#define KREFRESHPERSONALINFOMATION @"Grefreshpersonalinfomation"
@interface HomeViewController ()<UITextFieldDelegate>
{
    UITableView   *   _tableView;
    UILabel       *   _resignCountLabel;
    UILabel       *   _nav_nickNameLabel;//navigationitem 昵称
    UILabel       *   _nav_moneyLabel;//navigationItem 余额
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refresnPersonalInfomation:) name:KREFRESHPERSONALINFOMATION object:nil];
    //NAVIGATIONITEM
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(addAction)];
   
    UIView *view= [[UIView alloc]initWithFrame:CGRectMake(0, 0,App_Frame_Width, 40)];
    self.navigationItem.titleView = view;

    view.backgroundColor = [UIColor greenColor];
    _nav_nickNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, GetViewWidth(view)/2-60, 40)];
    _nav_nickNameLabel.backgroundColor = [UIColor clearColor];
    _nav_nickNameLabel.textColor = [UIColor whiteColor];
    _nav_nickNameLabel.textAlignment = NSTextAlignmentLeft;
    _nav_nickNameLabel.text = @"欢迎您，fuck";
    [view addSubview:_nav_nickNameLabel];
    
    _nav_moneyLabel = [[UILabel alloc]initWithFrame:CGRectMake(GetViewWidth(view)/2, 0, self. GetViewWidth(view)/2-30, 40)];
    _nav_moneyLabel.backgroundColor = [UIColor clearColor];
    _nav_moneyLabel.textColor = [UIColor whiteColor];
    _nav_moneyLabel.textAlignment = NSTextAlignmentRight;
    _nav_moneyLabel.text = @"游戏余额：1500金币";
    [view addSubview:_nav_moneyLabel];

    
    
    
    
    //背景底色图
    UIImageView *bgimageView =[[UIImageView alloc]initWithFrame:self.view.frame];
    bgimageView.image = GetImage(@"loignBG");
    [self.view addSubview:bgimageView];
    
//    UIView *view = [[UIView alloc]initWithFrame:self.view.frame];
//    view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
//    [self.view addSubview:view];
    
    [self buildTableView];
    
    //公告
    shufflingView *shuffView =[[ shufflingView alloc]initWithFrame:CGRectMake(0, 0, GetViewWidth(self.view), 30)];
    shuffView.backgroundColor = RGBA(225.0/225.0f, 225.0/225.0f, 225.0/225.0f, .2);
    
    [self.view addSubview:shuffView];
//    title:@"游戏公告：欢迎来到FUCKCAI，祝您财源广进"
    [shuffView setShufflingWithTitle:@"游戏公告：欢迎来到FUCKCAI，祝您财源广进"];
}

#pragma mark --网络请求

-(void)getInfo
{
    /*
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.phoneNumTF.text forKey:@"mobile"];
    [dic setObject:self.VerificationCodeTF.text forKey:@"mobileCode"];
    [dic setObject:self.passwordTF.text forKey:@"password"];
    [dic setObject:self.safeTF.text forKey:@"inviteCode"];
    [dic setObject:self.passwordTF.text forKey:@"username"];
    res =[[ ResignApi alloc]initWithParam:dic];
    [res startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.userInfo);
        DDLogInfo(@"%@",request.userInfo);
    } failure:^(__kindof YTKBaseRequest *request) {
        DDLogInfo(@"%@",request);
    }];
  */

}

//刷新个人数据
-(void)refresnPersonalInfomation:(NSNotification *)notification
{
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:notification.userInfo];
    _nav_nickNameLabel.text = [dic objectForKey:@""];
    _nav_moneyLabel.text = [dic objectForKey:@""];
}
//创建TableView

-(void)buildTableView
{
    _tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    [self buildTableHeadView];
}
//创建tableviewheadview
-(void)buildTableHeadView
{
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, GetViewWidth(self.view), 90)];
    view.backgroundColor =[UIColor clearColor];
    
    float width = 30;
    NSString * textStr = @"注册人数：";
    float lbwidth = [self getStringWidth:textStr];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(width, 45, lbwidth, 30)];
    lb.text  =textStr;
    lb.textAlignment = NSTextAlignmentLeft;
    lb.textColor = [UIColor whiteColor];
    lb.font =[UIFont systemFontOfSize:14];
    [view addSubview:lb];
    
    width+=lbwidth;
    
    _resignCountLabel = [[UILabel alloc]initWithFrame:CGRectMake(width+10, 45, 50, 30)];
    _resignCountLabel.text  =@"9910";
    _resignCountLabel.textAlignment = NSTextAlignmentLeft;
    _resignCountLabel.textColor = [UIColor whiteColor];
    _resignCountLabel.font =[UIFont boldSystemFontOfSize:14];
    [view addSubview:_resignCountLabel];

    width +=40;
    
    
    //提现button
    UIButton *drawalBtn = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self.view)/2+10, 47,GetViewWidth(self.view)/4-20, 26)];
    [drawalBtn didRadiusWithRadius:13 borderColor:HEXCOLOR(0xD76ED0)];
    [drawalBtn setBackgroundColor:HEXCOLOR(0xD76ED0)];
    [drawalBtn setTitle:@"提现" forState:UIControlStateNormal];
    [drawalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [drawalBtn addTarget:self action:@selector(didDrawal) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:drawalBtn];
    
    //充值button
    UIButton *topUpBtn = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self.view)/2+10+GetViewWidth(self.view)/4-20+20, 47,GetViewWidth(self.view)/4-20, 26)];
    [topUpBtn didRadiusWithRadius:13 borderColor:HEXCOLOR(0xD76ED0)];
    [topUpBtn setBackgroundColor:HEXCOLOR(0xFFAE04)];
    [topUpBtn setTitle:@"充值" forState:UIControlStateNormal];
    [topUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [topUpBtn addTarget:self action:@selector(didTopUp) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:topUpBtn];
    
    _tableView.tableHeaderView = view;
}

#pragma mark --充值 提现  方法
-(void)didDrawal
{
    
}
-(void)didTopUp
{
    
}

//获取字符串宽度
-(float)getStringWidth:(NSString *)str
{
    return [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(100, 30)].width;
}
#pragma mark -tableviewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 90;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellindentifier = @"homeViewCell";
    HomeViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"HomeViewTableViewCell" bundle:nil] forCellReuseIdentifier:cellindentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    }
    cell.tag = indexPath.row+100;
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(HomeViewTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
            cell.bgimageView.image = GetImage(@"saiche");
            cell.titleLB.text = @"北京赛车";
            [cell winningNumViewWithnum:@[@"01",@"03",@"05",@"07",@"09",@"10",@"02",@"08",@"04",@"06"]];

            break;
        case 1:
            cell.bgimageView.image = GetImage(@"jiangsu");
             cell.titleLB.text = @"江苏快三";
            [cell winningNumViewWithnum:@[@"09",@"10",@"02",@"08",@"04",@"06"]];

            break;
        case 2:
            cell.bgimageView.image = GetImage(@"saiting");
             cell.titleLB.text = @"幸运赛艇";
            [cell winningNumViewWithnum:@[@"08",@"04",@"06"]];

            break;
            
        default:
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GameContetnTableViewController *gaVC= [[GameContetnTableViewController alloc]init];
    [self.navigationController pushViewController:gaVC animated:YES];
    
}

#pragma mark----navigationItemAction
- (void)addAction
{
    [[DrawerViewController shareDrawer] showDrawer];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
