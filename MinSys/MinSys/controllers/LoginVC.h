//
//  LoginVC.h
//  MinSys
//
//  Created by centrin on 16/2/17.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *accountField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)touchLogin:(UIButton *)sender;
- (IBAction)touchRegist:(UIBarButtonItem *)sender;


@end
