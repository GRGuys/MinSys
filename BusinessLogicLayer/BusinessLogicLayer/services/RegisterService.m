//
//  RegisterService.m
//  FrameDemo
//
//  Created by centrin on 16/1/26.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "RegisterService.h"

@implementation RegisterService

- (void)requestVerificationCode:(NSString*)aPhoneNumber
{
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] initWithCapacity:2];
    [dic setObject:aPhoneNumber forKey:@"value"];
    [dic setObject:@"1" forKey:@"type"];
    
    [self.dao requestWithCommand:kDEF_CMD_PHONECODEX parameter:dic];
}

@end
