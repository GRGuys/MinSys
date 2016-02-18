//
//  CYKJLoginDao.h
//  PersistenceLayer
//
//  Created by centrin on 16/2/16.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "UserinfoModel.h"

@protocol CYKJLoginDaoPTC <NSObject>

@optional
- (void)responseLoginSuccessWithData:(CYKJUserinfoModel*)data;
- (void)responseLoginFailWithError:(NSString*)msg;

@end

@interface CYKJLoginDao : CYKJBaseDao


- (void)readLatestAccount;
- (void)updateAccount;

- (void)requestLoginWithAccount:(NSString*)aAccount password:(NSString*)aPassword;

@end
