//
//  GameContentTableViewCell.h
//  XinCaiProject
//
//  Created by SuperView on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameContentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *isZhuangTimageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *speciesLb;
@property (weak, nonatomic) IBOutlet UILabel *personCountLb;
@property (weak, nonatomic) IBOutlet UIImageView *proportionImageView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIImageView *cprogressImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midImageView;
@property (weak, nonatomic) IBOutlet UIView *leftBlackView;

@end
