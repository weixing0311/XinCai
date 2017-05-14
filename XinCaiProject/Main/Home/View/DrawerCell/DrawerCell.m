//
//  DrawerCell.m
//  DrawerViewController
//
//  Created by zhipeng on 16/10/17.
//  Copyright © 2016年 zhipeng. All rights reserved.
//

#import "DrawerCell.h"
@interface DrawerCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@end
@implementation DrawerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark ----- 重写set方法 -----
- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = title;
        self.label.text = title;
    }
}
- (void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName && ![_imageName isEqualToString:imageName]) {
        _imageName = imageName;
        if ([_imageName isEqualToString:@""]) {
            self.imageWidth.constant = 0;
            self.labelLeft.constant  = 0;
        }else{
            self.imgView.image = [UIImage imageNamed:imageName];
            self.imageWidth.constant = self.imgView.frame.size.height;
            self.labelLeft.constant  = 10;
        }
    }
}
- (void)layoutSubviews
{
    if (![self.imageName isEqualToString:@""] && self.imageName) {
        self.imageWidth.constant = self.contentView.frame.size.height - 10;
    }
}
@end
