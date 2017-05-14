//
//  Cm_animation.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/11.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "Cm_animation.h"
static Cm_animation *cmAnimation;
@implementation Cm_animation
{
    NSString * _cmFaceValue;
}
+(Cm_animation*)instence
{
    if (!cmAnimation) {
        cmAnimation = [[Cm_animation alloc]init];
    }
    return cmAnimation;
}
//获取点击筹码面值
-(void)getCMFaceValueWithTag:(NSInteger)theTag
{
    switch (theTag) {
        case 0:
            _cmFaceValue = [NSString stringWithFormat:@"10"];
            break;
        case 1:
            _cmFaceValue = [NSString stringWithFormat:@"50"];
            break;
        case 2:
            _cmFaceValue = [NSString stringWithFormat:@"100"];
            break;
        case 3:
            _cmFaceValue = [NSString stringWithFormat:@"500"];
            break;
        case 4:
            _cmFaceValue = [NSString stringWithFormat:@"1000"];
            break;
            
        default:
            break;
    }
}
-(UIImage*)returnCMFaceValue
{
    UIImage *image;
    
    switch ([_cmFaceValue intValue]) {
        case 10:
            image = GetImage(@"cm_10");
            break;
        case 50:
            image = GetImage(@"cm_50");
            break;
        case 100:
            image = GetImage(@"cm_100");
            break;
        case 500:
            image = GetImage(@"cm_500");
            break;
        case 1000:
            image = GetImage(@"cm_1000");
            break;
            
        default:
            break;
    }

    return image;
}
//筹码飞起
-(void)changeViewLocationWithView:(UIView *)view location:(CGRect)rect
{
    [UIView animateWithDuration:1 animations:^{
        view.frame = [self getLocationWithRect:(rect)];
    }];
}

-(CGRect)getLocationWithRect:(CGRect)rect
{
    int x; int y;
    x = [self getRandomNumber:rect.origin.x+10 to:(rect.size.width+rect.origin.x-10)];
    y = [self getRandomNumber:rect.origin.y+10 to:(rect.size.height+rect.origin.y-10)];
    return CGRectMake(x, y, 20, 20);
}

-(int)getRandomNumber:(int)from to:(int)to

{
    return (int)(from + (arc4random() % (to - from + 1)));
}



@end
