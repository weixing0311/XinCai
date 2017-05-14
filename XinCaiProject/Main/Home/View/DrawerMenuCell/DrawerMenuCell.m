//
//  DrawerMenuCell.m
//  XinCaiProject
//
//  Created by Gavin.Guo on 2017/3/27.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "DrawerMenuCell.h"
@interface DrawerMenuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DrawerMenuCell

-(void)setImageName:(NSString *)imageName{
    [self.iconImageView setImage:[UIImage imageNamed:imageName]];
}

-(void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
