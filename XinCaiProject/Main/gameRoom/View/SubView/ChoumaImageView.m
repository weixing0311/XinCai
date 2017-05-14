//
//  ChoumaImageView.m
//  XinCaiProject
//
//  Created by 魏星 on 2017/5/11.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "ChoumaImageView.h"

@implementation ChoumaImageView

- (id)init
{
    self = [super init];
    if (self) {
        switch (self.faceValueType) {
            case CM_FACE_VALUE_10:
                self.image = GetImage(@"cm_10");
                break;
            case CM_FACE_VALUE_50:
                self.image = GetImage(@"cm_50");
                break;
            case CM_FACE_VALUE_100:
                self.image = GetImage(@"cm_100");
                break;
            case CM_FACE_VALUE_500:
                self.image = GetImage(@"cm_500");
                break;
            case CM_FACE_VALUE_1000:
                self.image = GetImage(@"cm_1000");
                break;
                
            default:
                break;
        }
       
    }
    return self;
}

@end
