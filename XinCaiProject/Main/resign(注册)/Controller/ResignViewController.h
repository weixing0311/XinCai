//
//  ResignViewController.h
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResignViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *VerificationCodeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF2;
@property (weak, nonatomic) IBOutlet UITextField *safeTF;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTf;








@property (weak, nonatomic) IBOutlet UIButton *getRefBtn;
@property (weak, nonatomic) IBOutlet UIButton *resignBtn;

- (IBAction)didResign:(id)sender;
- (IBAction)getVerificationCode:(id)sender;

@end
