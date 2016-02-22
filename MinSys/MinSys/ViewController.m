//
//  ViewController.m
//  MinSys
//
//  Created by centrin on 16/2/16.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "ViewController.h"
#import "AccountInfoModel.h"
#import "LoginService.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIBarButtonItem *leftNavItem;
@property (strong, nonatomic) CYKJLoginService *service;
@property (strong, nonatomic) CYKJAccountInfoModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.service = [[CYKJLoginService alloc] init];
    self.service.delegate = self;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.model = [self.service readLatestAccount];

    if (self.model) {
        self.leftNavItem.title = self.model.account;
    }
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
//    self.title = item.title;
}



/**
 *  是否允许跳转
 *
 *  @param identifier
 *  @param sender
 *
 *  @return
 */
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

/**
 *  准备跳转
 *
 *  @param segue
 *  @param sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
