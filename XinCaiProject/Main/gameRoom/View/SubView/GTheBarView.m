//
//  GTheBarView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GTheBarView.h"
#import "TheMenView.h"
@implementation GTheBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView];//背景-绿色
        [self buildMenViewWithCount:5];
    }
    return self;
}
-(void)buildView
{
    UIImageView *bgImageView =[[UIImageView alloc]initWithFrame:self.bounds];
    bgImageView.image = GetImage(@"greenBG");
    [self addSubview:bgImageView];
    UIImageView *logoImg = [[UIImageView alloc]initWithImage:GetImage(@"logo")];
    logoImg.frame = CGRectMake(0, 0, GetViewWidth(self)/2, GetViewWidth(self)/2);
    [bgImageView addSubview:logoImg];
    
    UIImageView *logonameImg = [[UIImageView alloc]initWithImage:GetImage(@"logoname")];
    logonameImg.frame = CGRectMake(0, 0, 123, 45);
    [bgImageView addSubview:logonameImg];
    
    logoImg.center = bgImageView.center;
    logonameImg.center = CGPointMake(bgImageView.center.x, bgImageView.center.y+GetViewWidth(self)/4+30);
    
}

-(void)buildMenViewWithCount:(NSInteger)count
{
    
    TheMenView * men1 = [[TheMenView alloc]initWithFrame:CGRectMake(0, 0, (GetViewWidth(self)-40)/3, (GetViewWidth(self)-40)/3)];
    men1.center = CGPointMake(GetViewWidth(self)/2, 10+(GetViewWidth(self)-40)/6);
//    men1.backgroundColor = [UIColor blueColor];
    [men1 addTarget:self action:@selector(spendMoney:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:men1];
    
    TheMenView * men2 = [[TheMenView alloc]initWithFrame:CGRectMake(0, 0, (GetViewWidth(self)-40)/3, (GetViewWidth(self)-40)/3)];
    men2.center = CGPointMake(GetViewWidth(self)/6*5, (GetViewHeight(self)-40)/2);
//    men2.backgroundColor = [UIColor blueColor];
    [men2 addTarget:self action:@selector(spendMoney:) forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:men2];

    TheMenView * men3 = [[TheMenView alloc]initWithFrame:CGRectMake(0, 0, (GetViewWidth(self)-40)/3, (GetViewWidth(self)-40)/3)];
    men3.center = CGPointMake(GetViewWidth(self)/6*4, GetViewHeight(self)-(GetViewWidth(self)-40)/6-10);
    [men3 addTarget:self action:@selector(spendMoney:) forControlEvents:UIControlEventTouchUpInside];

//    men3.backgroundColor = [UIColor blueColor];
    [self addSubview:men3];

    TheMenView * men4 = [[TheMenView alloc]initWithFrame:CGRectMake(0, 0, (GetViewWidth(self)-40)/3, (GetViewWidth(self)-40)/3)];
    men4.center = CGPointMake(GetViewWidth(self)/6*2, GetViewHeight(self)-(GetViewWidth(self)-40)/6-10);
    [men4 addTarget:self action:@selector(spendMoney:) forControlEvents:UIControlEventTouchUpInside];

//    men4.backgroundColor = [UIColor blueColor];
    [self addSubview:men4];

    TheMenView * men5 = [[TheMenView alloc]initWithFrame:CGRectMake(0, 0, (GetViewWidth(self)-40)/3, (GetViewWidth(self)-40)/3)];
    men5.center = CGPointMake(GetViewWidth(self)/6, (GetViewHeight(self)-40)/2);
    [men5 addTarget:self action:@selector(spendMoney:) forControlEvents:UIControlEventTouchUpInside];

//    men5.backgroundColor = [UIColor blueColor];
    [self addSubview:men5];
    [men1 setTag:1];
    [men2 setTag:2];
    [men3 setTag:3];
    [men4 setTag:4];
    [men5 setTag:5];

}

-(void)spendMoney:(UIButton *)sender
{
    if (_MenBtnBlock) {
        _MenBtnBlock(sender);
    }
}
-(void)didMenBtnBlock:(TheMenButtonBlock)menBtnBlock
{
    self.MenBtnBlock=menBtnBlock;
}
@end
