//
//  HomeViewTableViewCell.h
//  XinCaiProject
//
//  Created by SuperView on 2017/5/3.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *numberView;
@property (weak, nonatomic) IBOutlet UIImageView *bgimageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *nperLB;
-(void)winningNumViewWithnum:(NSArray *)array;
@end
