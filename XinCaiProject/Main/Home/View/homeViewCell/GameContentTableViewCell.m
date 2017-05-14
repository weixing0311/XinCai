//
//  GameContentTableViewCell.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/9.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "GameContentTableViewCell.h"

@implementation GameContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.blackView.backgroundColor = RGBA(225.0/225.0F, 225.0/225.0F, 225.0/225.0F, 0.5);
    self.leftBlackView.backgroundColor =RGBA(225.0/225.0F, 225.0/225.0F, 225.0/225.0F, 0.5);
    [self.leftBlackView didRadiusWithRadius:5 borderColor:RGBA(225.0/225.0F, 225.0/225.0F, 225.0/225.0F, 0.5)];
    [self.midImageView didRadiusWithRadius:5 borderColor:RGBA(225.0/225.0F, 225.0/225.0F, 225.0/225.0F, 0.5)];
    [self.blackView didRadiusWithRadius:5 borderColor:RGBA(225.0/225.0F, 225.0/225.0F, 225.0/225.0F, 0.5)];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
