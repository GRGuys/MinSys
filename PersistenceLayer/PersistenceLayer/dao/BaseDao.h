//
//  BaseDao.h
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseHeader.h"

@protocol CYKJBaseDaoPTC <NSObject>

@optional
- (void)responseDaoSuccess:(CYKJResponseHeader*)responseModel;
- (void)responseDaoFail:(CYKJResponseHeader*)responseModel;

@end





@interface CYKJBaseDao : NSObject

@property(nonatomic, strong) id <CYKJBaseDaoPTC> delegate;

- (void)requestWithCommand:(NSString*)acmd parameter:(NSDictionary*)arequestDic;
- (void)requestWithCommand:(NSString*)acmd
                 parameter:(NSDictionary*)arequestDic
                   success:(void (^)(id responseObject))success
                   failure:(void (^)(id responseObject))failure;

- (void)responseWithCmd:(NSString*)aCmd data:(NSDictionary*)responseDic status:(NSInteger)astatus error:(NSError*)aerror;

@end
