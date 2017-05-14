//
//  TimeLabel.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/8.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "TimeLabel.h"
@interface TimeLabel()
@property (nonatomic, strong)NSTimer *timer;

@end
@implementation TimeLabel

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeHeadle) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)timeHeadle{
    
    self.second--;
    if (self.second==-1) {
        self.second=59;
        self.minute--;
        if (self.minute==-1) {
            self.minute=59;
            self.hour--;
        }
    }
    
    self.text = [NSString stringWithFormat:@"%ld:%ld:%ld",(long)self.hour,(long)self.minute,(long)self.second];
    if (self.second==0 && self.minute==0 && self.hour==0) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
/*
2.在需要倒计时器的类中导入头文件即可使用，示例：

TimeLable *lable = [[TimeLable alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
lable.hour = 10;
lable.minute = 38;
lable.second = 29;
[self.view addSubview:lable];
*/
@end
