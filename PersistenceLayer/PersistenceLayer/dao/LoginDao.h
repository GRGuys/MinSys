//
//  CYKJLoginDao.h
//  PersistenceLayer
//
//  Created by centrin on 16/2/16.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"

@class CYKJUserinfoModel;
@class CYKJAccountInfoModel;



@protocol CYKJLoginDaoPTC <NSObject>

@optional
- (void)responseLoginSuccessWithData:(CYKJUserinfoModel*)data;
- (void)responseLoginFailWithError:(NSString*)msg;

@end



@interface CYKJLoginDao : CYKJBaseDao

- (CYKJAccountInfoModel*)readLatestAccount;
- (void)updateAccount:(NSString*)account password:(NSString*)password;

- (CYKJUserinfoModel*)readLatestLoginInfo;

- (void)requestLoginWithAccount:(NSString*)aAccount password:(NSString*)aPassword;

@end
