//
//  GeneralLedgerView.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/3.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GeneralLedgerView.h"

@implementation GeneralLedgerView
{
    NSDictionary *dic ;
}
- (id)initWithFrame:(CGRect)frame info :(NSDictionary *)info
{
    self = [super initWithFrame:frame];
    if (self) {
        dic = [NSDictionary dictionaryWithDictionary:info];
        UIImageView  *imageView =[[UIImageView alloc]initWithFrame:frame];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.image = [UIImage imageNamed:@""];
        [self addSubview:imageView];
        
        UIView * blackView =[[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width/2, 0, self.frame.size.width, self.frame.size.height)];
        blackView.backgroundColor = [UIColor colorWithRed:1/225.0f green:1/225.0f blue:1/225.0f alpha:.5];
        [self addSubview:blackView];
        
        self.qsLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width/2-30, 30)];
        self.qsLabel.backgroundColor = [UIColor clearColor];
        self.qsLabel.text = @"最新开奖 123456期";
        self.qsLabel.textColor = [UIColor whiteColor];
        self.qsLabel.font= [UIFont boldSystemFontOfSize:13];
        [blackView addSubview:self.qsLabel];
        
        UIView * numView =[[ UIView alloc]initWithFrame:CGRectMake(0, 50, blackView.frame.size.width, 20)];
        numView.center = CGPointMake(blackView.frame.size.width/2, 50);
        [blackView addSubview:numView];
        int numcount = 7;
        for (int i = 0; i<numcount; i++) {
            UIImageView *imageView =[[ UIImageView alloc]initWithFrame:CGRectMake(i*20, 0, 20, 20)];
            imageView.image =[UIImage imageNamed:@""];
            [numView addSubview:imageView];
        }
        
        CGRect rect = CGRectMake(0, 0, numcount*20, 20);
        
        numView.frame = rect;
        
        
        
        UILabel *nextTimeLb = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width/2-30, 30)];
        nextTimeLb.backgroundColor = [UIColor clearColor];
        nextTimeLb.text = @"距离下次开奖剩余";
        nextTimeLb.textColor = [UIColor whiteColor];
        nextTimeLb.font= [UIFont boldSystemFontOfSize:13];
        [blackView addSubview:nextTimeLb];

        
        
        
        
        
        
    }
    return self;
}


@end
