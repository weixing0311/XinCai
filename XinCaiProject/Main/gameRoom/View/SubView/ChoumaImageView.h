//
//  ChoumaImageView.h
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/11.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CM_FACE_VALUE)
{
    CM_FACE_VALUE_10,
    CM_FACE_VALUE_50,      //面值 50，100 ，500，1000
    CM_FACE_VALUE_100,
    CM_FACE_VALUE_500,
    CM_FACE_VALUE_1000
    
};
@interface ChoumaImageView : UIImageView

@property(nonatomic,strong)NSString *type;
@property(nonatomic,assign)CM_FACE_VALUE faceValueType;
@end
