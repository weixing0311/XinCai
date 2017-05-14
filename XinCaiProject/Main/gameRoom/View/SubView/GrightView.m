//
//  GrightView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GrightView.h"
@implementation GrightView
{
    NSMutableArray *arr;//数据
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = HEXCOLOR(0xB14FE8);
        arr = [NSMutableArray array];
        [self buildView];
    }
    return self;
}
-(void)buildView
{
    float height = 0.0f;
    self.tableView =[[ UITableView alloc]initWithFrame:CGRectMake(0,height, GetViewWidth(self), GetViewHeight(self)/7*4) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor =[ UIColor clearColor];
    [self addSubview:self.tableView];
    
    
    height += GetViewHeight(self)/7*4;
    
    self.szBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, height+5, GetViewWidth(self)-20, 20)];
    [self addSubview:self.szBtn];
    
    height +=30;
    
    self.countDownLb = [[UILabel alloc]initWithFrame:CGRectMake(0, height, GetViewWidth(self), GetViewHeight(self)-height-20)];
    self.countDownLb.textAlignment = NSTextAlignmentCenter;
    self.countDownLb.font = [UIFont boldSystemFontOfSize:20];
    self.countDownLb.textColor = HEXCOLOR(0xC020A2);
    self.countDownLb.text = @"45";
    self.countDownLb.backgroundColor =[ UIColor clearColor];
    [self addSubview:self.countDownLb];
    
    
    UILabel *m_tsLB = [[UILabel alloc]initWithFrame:CGRectMake(0, GetViewHeight(self)-20, GetViewWidth(self), 20)];
    m_tsLB.textAlignment = NSTextAlignmentCenter;
    m_tsLB.font = [UIFont boldSystemFontOfSize:15];
    m_tsLB.textColor = HEXCOLOR(0xC020A2);
    m_tsLB.backgroundColor =[ UIColor clearColor];
    m_tsLB.text = @"离投注结束还剩";
    [self addSubview:m_tsLB];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"userCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = @"gameuser";
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"上庄列表";
}

#pragma mark --reloaddata
-(void)reloadDataWithInfo:(NSMutableArray *)info
{
    arr = [NSMutableArray arrayWithArray:info];
    [self.tableView reloadData];
}
-(void)startCountDown:(NSString *)str
{
    self.countDownLb.text = str;
}

@end
