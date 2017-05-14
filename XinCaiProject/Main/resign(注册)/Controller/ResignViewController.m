//
//  ResignViewController.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/4.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "ResignViewController.h"
#import "ResignModel.h"
#import "ResignApi.h"
#import "resCodeService.h"
@interface ResignViewController ()
{
    MBProgressHUD *hud ;
}
@end

@implementation ResignViewController
{
    ResignApi *res;
    resCodeService *resCode;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:GetImage(@"backBtn.png") style:UIBarButtonItemStyleDone target:self action:@selector(goback)];
    
    self.phoneNumTF.keyboardType = UIKeyboardTypeNumberPad;
    self.VerificationCodeTF.keyboardType = UIKeyboardTypeNumberPad;
    self.safeTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.getRefBtn setTitleColor:HEXCOLOR(0xD76ED0) forState:UIControlStateNormal];
    [self.resignBtn setTitleColor:HEXCOLOR(0XD76ED0) forState:UIControlStateNormal];
    self.resignBtn.layer.masksToBounds = YES;
    self.resignBtn.layer.cornerRadius = 20;
    self.resignBtn.layer.borderWidth = 2.0;
    self.resignBtn.layer.borderColor = HEXCOLOR(0XD76ED0).CGColor;
    // Do any additional setup after loading the view from its nib.
}

//settextcolor
-(void)setTextClolr
{
    [self.nicknameTf setTextColor:HEXCOLOR(0XCECECE)];
    [self.phoneNumTF setTextColor:HEXCOLOR(0XCECECE)];
    [self.VerificationCodeTF setTextColor:HEXCOLOR(0XCECECE)];
    [self.passwordTF setTextColor:HEXCOLOR(0XCECECE)];
    [self.passwordTF2 setTextColor:HEXCOLOR(0XCECECE)];
    [self.safeTF setTextColor:HEXCOLOR(0XCECECE)];

}




-(void)goback
{
    [self dismissViewControllerAnimated:YES completion:^{
        [res stop];
        [resCode stop];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didResign:(id)sender {

    ResignModel *resignModel = [ResignModel defaultManager];
    if (!kStringIsEmpty(self.nicknameTf.text)) {
        [self showMBProgressHUDWithMessage:@"请输入昵称"];
        return;
    }
    if (!kStringIsEmpty(self.phoneNumTF.text)) {
        [self showMBProgressHUDWithMessage:@"请输入手机号"];
        return;
    }
    if (!kStringIsEmpty(self.passwordTF.text)) {
        [self showMBProgressHUDWithMessage:@"请输入密码"];
        return;
    }
    if (!kStringIsEmpty(self.passwordTF2.text)&&![self.passwordTF2.text isEqualToString:self.passwordTF.text]) {
        [self showMBProgressHUDWithMessage:@"两次密码不同"];
        return;
    }
    if (!kStringIsEmpty(self.safeTF.text)) {
        [self showMBProgressHUDWithMessage:@"请输入邀请码"];
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:self.phoneNumTF.text forKey:@"mobile"];
    [dic setObject:self.VerificationCodeTF.text forKey:@"mobileCode"];
    [dic setObject:self.passwordTF.text forKey:@"password"];
    [dic setObject:self.safeTF.text forKey:@"inviteCode"];
    [dic setObject:self.passwordTF.text forKey:@"username"];
    res =[[ ResignApi alloc]initWithParam:dic];
    [res startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.userInfo);
        DDLogInfo(@"%@",request.userInfo);
    } failure:^(__kindof YTKBaseRequest *request) {
        DDLogInfo(@"%@",request);
    }];
}

-(void)showMBProgressHUDWithMessage:(NSString *)mes
{
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    hud.mode = MBProgressHUDModeText;
    hud.labelText = mes;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:3]; }


- (IBAction)getVerificationCode:(id)sender {
    if (![[ResignModel defaultManager] isEmptyWithString:self.phoneNumTF.text]) {
        NSLog(@"手机号为空");
        [self showMBProgressHUDWithMessage:@"手机号为空"];
        return;
    }else if (![[ResignModel defaultManager] valiMobile:self.phoneNumTF.text]){
        [self showMBProgressHUDWithMessage:@"输入正确的手机号"];
    return;
    }
    resCode =[[ resCodeService alloc]initWithmobileNum:self.phoneNumTF.text];
    [resCode startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        DDLogError(@"%@",request.userInfo);
    } failure:^(__kindof YTKBaseRequest *request) {
        DDLogError(@"%@",request);
    }];
    
    
}
@end
