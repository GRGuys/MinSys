//
//  RegisterService.h
//  FrameDemo
//
//  Created by centrin on 16/1/26.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseService.h"

@protocol CYKJRegisterServicePTC <CYKJBaseServicePTC>

@end

@interface RegisterService : CYKJBaseService

@property (nonatomic, strong) CYKJBaseDao* dao;

- (void)requestVerificationCode:(NSString*)aPhoneNumber;

@end
