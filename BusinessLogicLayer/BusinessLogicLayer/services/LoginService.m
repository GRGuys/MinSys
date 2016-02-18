//
//  LoginService.m
//  FrameDemo
//
//  Created by centrin on 16/1/21.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "LoginService.h"
#import "BaseDao.h"
#import "LoginDao.h"
#import "Constants.h"

@implementation CYKJLoginService

- (void)requestLoginWithAccount:(NSString *)account password:(NSString *)password
{
//    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithCapacity:2];
//    [dic setObject:account forKey:@"loginname"];
//    [dic setObject:password forKey:@"password"];
    
//    [self.dao requestWithCommand:kDEF_CMD_LOGIN parameter:dic];
    
    self.dao = [[CYKJLoginDao alloc] init];
    self.dao.delegate = self;
    [(CYKJLoginDao*)self.dao requestLoginWithAccount:account password:password];
}

//- (void)responseDaoSuccess:(CYKJResponseHeader *)responseModel
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ACCOUNT_UPDATE object:responseModel];
//    [super responseDaoSuccess:responseModel];
//}
//
//- (void)responseDaoFail:(CYKJResponseHeader *)responseModel
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ACCOUNT_UPDATE object:responseModel];
//    [super responseDaoFail:responseModel];
//}

- (void)responseLoginSuccessWithData:(CYKJUserinfoModel *)data
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ACCOUNT_UPDATE object:data];
    if ([self.delegate respondsToSelector:@selector(responseSuccess:)]) {
        [self.delegate responseSuccess:nil];
    }
}

- (void)responseLoginFailWithError:(NSString *)msg
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_ACCOUNT_UPDATE object:msg];
    if ([self.delegate respondsToSelector:@selector(responseFail:)]) {
        [self.delegate responseFail:nil];
    }
}


@end
