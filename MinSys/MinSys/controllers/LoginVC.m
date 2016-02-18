//
//  LoginVC.m
//  MinSys
//
//  Created by centrin on 16/2/17.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "LoginVC.h"
#import "LoginService.h"
#import "SVProgressHUD.h"

@interface LoginVC ()

@property(nonatomic, strong) CYKJLoginService* service;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.service = [[CYKJLoginService alloc] init];
    self.service.delegate = self;
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    self.accountField.text = [ud objectForKey:@"lastLoginAccount"];
    self.passwordField.text = [ud objectForKey:@"lastLoginAccountPwd"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelLogin:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


/**
 *  准备跳转至注册页
 *
 *  @param segue
 *  @param sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)touchLogin:(UIButton *)sender {
    NSString* account = [self.accountField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString* pwd = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:account forKey:@"lastLoginAccount"];
    [ud setObject:pwd forKey:@"lastLoginAccountPwd"];
    
    [self.service requestLoginWithAccount:account password:pwd];
}

- (IBAction)touchRegist:(UIBarButtonItem *)sender {
    
}

- (void)responseSuccess:(CYKJResponseHeader*)responseModel
{
    [self cancelLogin:nil];
}

- (void)responseFail:(CYKJResponseHeader*)responseModel
{
    [SVProgressHUD showErrorWithStatus:@"登录失败！"];
}


@end
