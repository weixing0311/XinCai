//
//  GameContetnTableViewController.m
//  XinCaiProject
//
//  Created by superView on 2017/5/8.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GameContetnTableViewController.h"
#import "GameContentTableViewCell.h"
#import "GameRoomViewController.h"
@interface GameContetnTableViewController ()
@property(nonatomic,strong)UIButton * p9Btn;//牌九
@property(nonatomic,strong)UIButton * nnBtn;//牛牛
@property(nonatomic,strong)UIButton * sgBtn;//三公
@property(nonatomic,strong)UIButton * tenBottomNoteBtn;//10底注
@property(nonatomic,strong)UIButton * huntBottomNoteBtn;//100底注
@property(nonatomic,strong)UIButton * ExperienceField;//体验场
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation GameContetnTableViewController
{
    NSArray * _bigTitleArr;
    NSArray * _roomTitleArr;
    NSMutableDictionary * paramDic;
    NSMutableArray * _infoArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _bigTitleArr = [NSArray arrayWithObjects:@"牌九",@"牛牛",@"三公",nil];
    _roomTitleArr = [NSArray arrayWithObjects:@"底注 10",@"底注 100",@"体验场",nil];
    _infoArr = [NSMutableArray array];
    paramDic = [NSMutableDictionary dictionary];
    
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    [_infoArr addObject:@{@"1":@"zhuang",@"32":@"presonCount"}];
    
    UIImageView *bgimageView =[[UIImageView alloc]initWithFrame:self.view.frame];
    bgimageView.image = GetImage(@"loignBG");
    [self.view addSubview:bgimageView];

    
    
    [self buildTableView];
    
    
//    [self buildTableHeadView];
}




-(void)buildTableView
{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

-(void)buildTableHeadView
{
    UIView *tabHeadView = [[UIView alloc]initWithFrame:CGRectZero];
    tabHeadView.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *seg1 = [[UISegmentedControl alloc]initWithItems:_bigTitleArr];
    seg1.frame = CGRectMake(0, 0, GetViewWidth(self.view), 80);
    [seg1 addTarget:self action:@selector(didSegment1:) forControlEvents:UIControlEventValueChanged];
    seg1.selectedSegmentIndex = 0;
    [seg1 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    [tabHeadView addSubview:seg1];
    
    
    UISegmentedControl *seg2 = [[UISegmentedControl alloc]initWithItems:_roomTitleArr];
    seg2.frame = CGRectMake(0, 80, GetViewWidth(self.view), 40);
    [seg2 addTarget:self action:@selector(didSegment2:) forControlEvents:UIControlEventValueChanged];
    [seg2 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    seg2.selectedSegmentIndex = 0;
    [tabHeadView addSubview:seg2];
    self.tableView.tableHeaderView = tabHeadView;
}
-(void)didSegment1:(UISegmentedControl*)sengment
{
    [self getUpdataInfoWithDic:sengment.selectedSegmentIndex key:YES];
}
-(void)didSegment2:(UISegmentedControl*)sengment
{
    [self getUpdataInfoWithDic:sengment.selectedSegmentIndex key:NO];
}

-(void)GetBigId:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:sender.tag];
    if (button.selected) {
        return;
    }
    [self changeBtnWithTag:sender.tag];
}
-(void)GetRoomId:(UIButton *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:sender.tag];
    if (button.selected) {
        return;
    }
    [self changeBtnWithTag:sender.tag];
}
-(void)changeBtnWithTag:(NSInteger)tag
{
    
    UIButton *button1 = (UIButton *)[self.view viewWithTag:110];
    UIButton *button2 = (UIButton *)[self.view viewWithTag:111];
    UIButton *button3 = (UIButton *)[self.view viewWithTag:112];
    UIButton *button4 = (UIButton *)[self.view viewWithTag:120];
    UIButton *button5 = (UIButton *)[self.view viewWithTag:121];
    UIButton *button6 = (UIButton *)[self.view viewWithTag:122];

    switch (tag) {
        case 110:
            [self changeBtnStateWithSelected:YES button:button1];
            [self changeBtnStateWithSelected:NO button:button2];
            [self changeBtnStateWithSelected:NO button:button3];
            break;
        case 111:
            [self changeBtnStateWithSelected:NO button:button1];
            [self changeBtnStateWithSelected:YES button:button2];
            [self changeBtnStateWithSelected:NO button:button3];
           
            break;
        case 112:
            [self changeBtnStateWithSelected:NO button:button1];
            [self changeBtnStateWithSelected:NO button:button2];
            [self changeBtnStateWithSelected:YES button:button3];
            
            break;
        case 120:
            [self changeBtnStateWithSelected:YES button:button4];
            [self changeBtnStateWithSelected:NO button:button5];
            [self changeBtnStateWithSelected:NO button:button6];
            
            break;
        case 121:
            [self changeBtnStateWithSelected:NO button:button4];
            [self changeBtnStateWithSelected:YES button:button5];
            [self changeBtnStateWithSelected:NO button:button6];
            
            break;
        case 122:
            [self changeBtnStateWithSelected:NO button:button4];
            [self changeBtnStateWithSelected:NO button:button5];
            [self changeBtnStateWithSelected:YES button:button6];
            
            break;
            
        default:
            break;
    }
}

-(void)changeBtnStateWithSelected:(BOOL)selected button:(UIButton *)button
{
    if (selected) {
        button.selected = NO;
        [button setBackgroundColor:[UIColor blueColor]];
    }else
    {
        button.selected = YES;
        [button setBackgroundColor:[UIColor greenColor]];
    }
}



#pragma mark --网络请求

//重置请求数据
-(void)getUpdataInfoWithDic:(NSInteger)xindexPath key:(BOOL)key
{
    if (key) {
        [paramDic setObject:_bigTitleArr[xindexPath] forKey:@""];
    }else{
        [paramDic setObject:_roomTitleArr[xindexPath] forKey:@""];
    }
    
    [self getInfo];
}
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
     
     [self.tableview reloadData];
     
     } failure:^(__kindof YTKBaseRequest *request) {
     DDLogInfo(@"%@",request);
     }];
     */
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *tabHeadView = [[UIView alloc]initWithFrame:CGRectZero];
    tabHeadView.backgroundColor = [UIColor whiteColor];
    
    UISegmentedControl *seg1 = [[UISegmentedControl alloc]initWithItems:_bigTitleArr];
    seg1.frame = CGRectMake(0, 0, GetViewWidth(self.view), 80);
    [seg1 addTarget:self action:@selector(didSegment1:) forControlEvents:UIControlEventValueChanged];
    seg1.selectedSegmentIndex = 0;
    [seg1 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    [tabHeadView addSubview:seg1];
    
    
    UISegmentedControl *seg2 = [[UISegmentedControl alloc]initWithItems:_roomTitleArr];
    seg2.frame = CGRectMake(0, 80, GetViewWidth(self.view), 40);
    [seg2 addTarget:self action:@selector(didSegment2:) forControlEvents:UIControlEventValueChanged];
    [seg2 setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]} forState:UIControlStateSelected];
    seg2.selectedSegmentIndex = 0;
    [tabHeadView addSubview:seg2];
    return tabHeadView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _infoArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    static NSString *cellindentifier = @"gameContentViewCell";
    GameContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"GameContentTableViewCell" bundle:nil] forCellReuseIdentifier:cellindentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellindentifier];
    }
    cell.tag = indexPath.row+100;
    cell.backgroundColor = [UIColor clearColor];
    cell.isZhuangTimageView.image = GetImage(@"winningNum_07");
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(GameContentTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [_infoArr objectAtIndex:indexPath.row];
    cell.titleLabel.text = [NSString stringWithFormat:@"北京赛车%ld",indexPath.row+1];
//    cell.personCountLb.text =[dic objectForKey:@"presonCount"];
    cell.midImageView.image = GetImage(@"saiche");
    CGRect rec = cell.cprogressImageView.frame;
    rec.size.height = 55;
    cell.cprogressImageView.frame = rec;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GameRoomViewController *groomVC = [[GameRoomViewController alloc]init];
    [self.navigationController pushViewController:groomVC animated:YES];
    
}
@end
