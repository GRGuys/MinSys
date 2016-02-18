//
//  BaseService.h
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseHeader.h"
#import "BaseDao.h"
#import "HttpCommandConstants.h"

@protocol CYKJBaseServicePTC <NSObject>

@optional
- (void)responseSuccess:(CYKJResponseHeader*)responseModel;
- (void)responseFail:(CYKJResponseHeader*)responseModel;

@end


@interface CYKJBaseService : NSObject <CYKJBaseDaoPTC>

@property (nonatomic, strong) CYKJBaseDao* dao;
@property (nonatomic, strong) id <CYKJBaseServicePTC> delegate;

@end
