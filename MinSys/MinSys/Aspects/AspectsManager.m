//
//  AspectsManager.m
//  MinSys
//
//  Created by centrin on 16/2/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "AspectsManager.h"
#import <UIKit/UIKit.h>
#import "LoginVC.h"
#import "NSObject+Reflect.h"
#import "BaseService.h"

@implementation AspectsManager

+ (void)createLoginHook
{
    [UIViewController aspect_hookSelector:@selector(viewDidLoad)
                              withOptions:AspectPositionBefore
                               usingBlock:^(id<AspectInfo> info){
                                   //用户统计代码可写在此处
                                   if ([[info instance] class] == [LoginVC class]) {
                                       NSLog(@"登录一次....");
                                       
                                       id selfInstance = [info instance];
                                       [selfInstance propInitSelf:[CYKJBaseService class]];
                                       
                                   }
                               }
                                    error:NULL];

}

@end
