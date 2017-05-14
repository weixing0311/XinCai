//
//  GBottomView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/10.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GBottomView.h"

@implementation GBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView ];
    }
    return self;
}

-(void)buildView
{
    //剩余游戏币
    self.moneyLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 20)];
    self.moneyLb.textColor = [UIColor whiteColor];
    self.moneyLb.textAlignment = NSTextAlignmentLeft;
    self.moneyLb.font = [UIFont systemFontOfSize:12];
    self.moneyLb.text = @"游戏余额：1000金币";
    [self addSubview:self.moneyLb];
    //充值button
    self.topUpBtn = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self.moneyLb)+20, 10, 60, 20)];
    [self.topUpBtn setBackgroundColor:HEXCOLOR(0xFFA431)];
    [self.topUpBtn setTitle:@"快速充值" forState:UIControlStateNormal];
    [self.topUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.topUpBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.topUpBtn addTarget:self action:@selector(didtopUp) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.topUpBtn];
    
    
    self.questionBtn = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self)-100, 10, 30, 30)];
    [self.questionBtn setBackgroundColor:HEXCOLOR(0xFFA431)];
    [self.questionBtn setTitle:@"?" forState:UIControlStateNormal];
    [self.questionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.questionBtn addTarget:self action:@selector(didASK) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.questionBtn];

    self.personBtn = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self)-50, 10, 60, 20)];
    [self.personBtn setBackgroundColor:HEXCOLOR(0xFFA431)];
    [self.personBtn setTitle:@"人" forState:UIControlStateNormal];
    [self.personBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.personBtn addTarget:self action:@selector(youcansee) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.personBtn];

    
    
    
    [self buildbtn];
    
//    筹码
//    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"10",@"50",@"100",@"500",@"1000"]];
//    [seg setImage:GetImage(@"cm_10") forSegmentAtIndex:0];
//    [seg setImage:GetImage(@"cm_50") forSegmentAtIndex:1];
//    [seg setImage:GetImage(@"cm_100") forSegmentAtIndex:2];
//    [seg setImage:GetImage(@"cm_500") forSegmentAtIndex:3];
//    [seg setImage:GetImage(@"cm_1000") forSegmentAtIndex:4];
//    seg.selectedSegmentIndex = 0;
//    seg.frame = CGRectMake(0, 30, GetViewWidth(self), GetViewHeight(self)-30);
//    [seg addTarget:self action:@selector(getCM:) forControlEvents:UIControlEventValueChanged];
//    [self addSubview:seg];
    
}
#pragma mark 自定义segmentcontroller

-(void)buildbtn
{
    NSArray *Arr = @[@"cm_10",@"cm_50",@"cm_100",@"cm_500",@"cm_1000"];
    for ( int i =0; i<Arr.count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(GetViewWidth(self)/5*i+10, GetViewHeight(self)*0.3, GetViewWidth(self)/5-20, GetViewWidth(self)/5-20)];
        [button setBackgroundImage:GetImage(Arr[i]) forState:UIControlStateNormal];
        button.tag = i+1;
        [button didRadiusWithRadius:(GetViewWidth(self)/5-20)/2 borderColor:[UIColor clearColor]];
        [button addTarget:self action:@selector(getCM:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    [self selectedAtIndex:0];

}
-(void)getCM:(UIButton *)seg
{
    if (self.didCMChangBlock) {
        self.didCMChangBlock(seg);
    }
    [self selectedAtIndex:seg.tag-1];
}
-(void)didChangeCMBlock:(cmChangeBlock)changeCmBlock
{
    self.didCMChangBlock = changeCmBlock;
}
-(void)selectedAtIndex:(NSInteger)index
{
    UIButton *b1 = (UIButton *)[self viewWithTag:1];
    UIButton *b2 = (UIButton *)[self viewWithTag:2];
    UIButton *b3 = (UIButton *)[self viewWithTag:3];
    UIButton *b4 = (UIButton *)[self viewWithTag:4];
    UIButton *b5 = (UIButton *)[self viewWithTag:5];
    switch (index+1) {
        case 1:
            b1.layer.borderColor = [UIColor yellowColor].CGColor;
            b2.layer.borderColor = [UIColor clearColor].CGColor;
            b3.layer.borderColor = [UIColor clearColor].CGColor;
            b4.layer.borderColor = [UIColor clearColor].CGColor;
            b5.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        case 2:
            b1.layer.borderColor = [UIColor clearColor].CGColor;
            b2.layer.borderColor = [UIColor yellowColor].CGColor;
            b3.layer.borderColor = [UIColor clearColor].CGColor;
            b4.layer.borderColor = [UIColor clearColor].CGColor;
            b5.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        case 3:
            b1.layer.borderColor = [UIColor clearColor].CGColor;
            b2.layer.borderColor = [UIColor clearColor].CGColor;
            b3.layer.borderColor = [UIColor yellowColor].CGColor;
            b4.layer.borderColor = [UIColor clearColor].CGColor;
            b5.layer.borderColor = [UIColor clearColor].CGColor;
            
            break;
        case 4:
            b1.layer.borderColor = [UIColor clearColor].CGColor;
            b2.layer.borderColor = [UIColor clearColor].CGColor;
            b3.layer.borderColor = [UIColor clearColor].CGColor;
            b4.layer.borderColor = [UIColor yellowColor].CGColor;
            b5.layer.borderColor = [UIColor clearColor].CGColor;
            
            break;
        case 5:
            b1.layer.borderColor = [UIColor clearColor].CGColor;
            b2.layer.borderColor = [UIColor clearColor].CGColor;
            b3.layer.borderColor = [UIColor clearColor].CGColor;
            b4.layer.borderColor = [UIColor clearColor].CGColor;
            b5.layer.borderColor = [UIColor yellowColor].CGColor;
            
            break;
            
        default:
            break;
    }

}



-(void)didtopUp
{
    
}
-(void)didASK
{
    
}

-(void)youcansee
{
    
}

-(void)refreshInfo
{
    NSString *money = [NSString stringWithFormat:@"游戏余额：%@",@"9999"];
    CGSize size = [money sizeWithFont:[UIFont systemFontOfSize:12]];
    CGRect rec = self.moneyLb.frame;
    rec.size.width = size.width;
    self.moneyLb.frame = rec;
    
    CGRect rec1 = self.topUpBtn.frame;
    rec1.origin.x = rec.origin.x+rec.size.width;
    self.topUpBtn.frame = rec1;
}

@end
