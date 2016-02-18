//
//  CYKJLoginDao.m
//  PersistenceLayer
//
//  Created by centrin on 16/2/16.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "LoginDao.h"
#import "HttpCommandConstants.h"

@implementation CYKJLoginDao

- (void)requestLoginWithAccount:(NSString *)aAccount password:(NSString *)aPassword
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithCapacity:2];
    [dic setObject:aAccount forKey:@"loginname"];
    [dic setObject:aPassword forKey:@"password"];

    __weak CYKJLoginDao* __weakself = self;
    [self requestWithCommand:kDEF_CMD_LOGIN parameter:dic success:^(id responseObject)
    {
        if ([__weakself.delegate respondsToSelector:@selector(responseLoginSuccessWithData:)]) {
            
            [__weakself.delegate performSelector:@selector(responseLoginSuccessWithData:) withObject:responseObject];
        }
        
    } failure:^(id responseObject)
    {
        if ([__weakself.delegate respondsToSelector:@selector(responseLoginFailWithError:)]) {
            [__weakself.delegate performSelector:@selector(responseLoginFailWithError:) withObject:responseObject];
        }
    }];
}


@end
