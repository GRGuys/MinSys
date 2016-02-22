//
//  BaseService.m
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "BaseService.h"

@implementation CYKJBaseService

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.dao = [[CYKJBaseDao alloc] init];
//        self.dao.delegate = self;
    }
    return self;
}

- (void)responseDaoSuccess:(CYKJResponseHeader *)responseModel
{
    if ([self.delegate respondsToSelector:@selector(responseSuccess:)]) {
        [self.delegate responseSuccess:responseModel];
    }
}

- (void)responseDaoFail:(CYKJResponseHeader *)responseModel
{
    if ([self.delegate respondsToSelector:@selector(responseFail:)]) {
        [self.delegate responseFail:responseModel];
    }
}

@end
