//
//  CYKJLoginDao.m
//  PersistenceLayer
//
//  Created by centrin on 16/2/16.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "LoginDao.h"
#import "HttpCommandConstants.h"
#import "AccountInfoModel.h"
#import "UserinfoModel.h"
#import "StorageFile.h"
#import "Constants.h"

#define LOGINDAO_LAST_ACCOUNT @"lastLoginAccount"
#define LOGINDAO_LAST_PWD @"lastLoginAccountPwd"


@implementation CYKJLoginDao


- (CYKJAccountInfoModel *)readLatestAccount
{
    CYKJAccountInfoModel* model = [[CYKJAccountInfoModel alloc] init];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    model.account = [ud objectForKey:LOGINDAO_LAST_ACCOUNT];
    model.password = [ud objectForKey:LOGINDAO_LAST_PWD];
    return model;
}

- (void)updateAccount:(NSString *)account password:(NSString *)password
{
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:account forKey:LOGINDAO_LAST_ACCOUNT];
    [ud setObject:password forKey:LOGINDAO_LAST_PWD];
}

- (CYKJUserinfoModel*)readLatestLoginInfo
{
    NSString* str = [CYKJStorageFile readOffLineDataWithModule:KSTORAGEFILE_LOGIN_INFO userId:nil];
    return [[CYKJUserinfoModel alloc] initWithString:str error:nil];
}


- (void)saveLoginInfo:(id)data
{
//    [CYKJStorageFile writeOffLineDataWithModule:KSTORAGEFILE_LOGIN_INFO dataStr:data AndUserId:nil];
}

- (void)requestLoginWithAccount:(NSString *)aAccount password:(NSString *)aPassword
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithCapacity:2];
    [dic setObject:aAccount forKey:@"loginname"];
    [dic setObject:aPassword forKey:@"password"];

    __weak CYKJLoginDao* __weakself = self;
    [self requestWithCommand:kDEF_CMD_LOGIN parameter:dic success:^(id responseObject)
    {
        if ([__weakself.delegate respondsToSelector:@selector(responseLoginSuccessWithData:)]) {
            
            [self saveLoginInfo:responseObject];
            //xxxx
            [__weakself.delegate performSelector:@selector(responseLoginSuccessWithData:) withObject:responseObject];
        }
        
    } failure:^(id responseObject) {
        if ([__weakself.delegate respondsToSelector:@selector(responseLoginFailWithError:)]) {
            [__weakself.delegate performSelector:@selector(responseLoginFailWithError:) withObject:responseObject];
        }
    }];
}





@end
