//
//  ForgetPasswordViewController.h
//  XinCaiProject
//
//  Created by SuperView on 2017/5/5.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *accountTf;
@property (weak, nonatomic) IBOutlet UITextField *cardTf;

- (IBAction)didUpdata:(id)sender;
@end
