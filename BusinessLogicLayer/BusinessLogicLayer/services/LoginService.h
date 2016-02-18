//
//  LoginService.h
//  FrameDemo
//
//  Created by centrin on 16/1/21.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"
#import "RequestHeader.h"
#import "LoginDao.h"

@protocol CYKJLoginServicePTC <CYKJBaseServicePTC>

- (void)responseLoginSuccess:(CYKJUserinfoModel*)data;
- (void)responseLoginFail:(NSError*)error;

@end

@interface CYKJLoginService : CYKJBaseService <CYKJLoginDaoPTC>

- (void)requestLoginWithAccount:(NSString*)account password:(NSString*)password;

@end
