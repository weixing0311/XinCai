//
//  ForgetPasswordViewController.m
//  XinCaiProject
//
//  Created by SuperView on 2017/5/5.
//  Copyright © 2017年 XinCai. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "ChangePasswordViewController.h"
#define kScreenWidth [UIApplication sharedApplication].keyWindow.frame.size.width
#define kScreenHight [UIApplication sharedApplication].keyWindow.frame.size.height
@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back.png"] landscapeImagePhone:[UIImage imageNamed:@"back.png"] style:UIBarButtonItemStyleDone target:self action:@selector(goback)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(goback)];

    
}
-(void)goback
{
    [self dismissViewControllerAnimated:YES completion:^{
        
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

- (IBAction)didUpdata:(id)sender {
    
    ChangePasswordViewController *changePas = [[ChangePasswordViewController alloc]init];
    [self.navigationController pushViewController:changePas animated:YES];
    
}

@end
