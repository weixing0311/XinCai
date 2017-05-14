//
//  HomeViewTableViewCell.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/3.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "HomeViewTableViewCell.h"

@implementation HomeViewTableViewCell
{
    UIView *numView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.blackView.layer setCornerRadius:5];
    self.blackView.layer.masksToBounds = YES;
    self.numberView.hidden = YES;

}
-(void)winningNumViewWithnum:(NSArray *)array
{
    if (numView) {
        [numView removeFromSuperview];
    }
       numView = [[UIView alloc]init];
    self.blackView.backgroundColor =RGBA(225/225.0f, 225/225.0f, 225/225.0f, 0.4);
    CGFloat x = GetViewWidth(self.blackView)/2;
    CGFloat starX = x-22*array.count/2;
    
    
    for (int i =0; i<array.count; i++) {
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(starX+i*22, GetViewY(self.nperLB)+GetViewHeight(self.nperLB)+5, 20, 20)];
        NSString *imageName = array[i];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"winningNum_%@",imageName]];
        [self.blackView addSubview:imageView];
        
        UILabel *lb =[[UILabel alloc]initWithFrame:CGRectMake(starX+i*22, GetViewY(self.nperLB)+GetViewHeight(self.nperLB)+5, 20, 20)];
        lb.backgroundColor =[ UIColor clearColor];
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = array[i];
        lb.font = [UIFont systemFontOfSize:13];
        [self.blackView addSubview:lb];
    }
    
    
/*
    CGSize size = CGSizeMake(array.count*22, GetViewHeight(self.numberView));
    numView.frame = CGRectMake(0, 0, size.width, size.height);
    numView.center = self.numberView.center;
    [self.numberView addSubview:numView];
 */
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
