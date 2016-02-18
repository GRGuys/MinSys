//
//  CYKJRequestHeader.m
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "RequestHeader.h"
#import "XUtil.h"
#import "AccountMemory.h"

@implementation CYKJRequestHeader

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.version = [CYKJXUtil getAppVersion];
        self.restime = [CYKJXUtil getCurTimeRandNum];
        self.uuid = [CYKJXUtil getDeviceId];
        self.appId = [[NSString alloc] initWithString:[NSString stringWithFormat:@"ios%@_%@",[CYKJXUtil getDeviceSystemVersion], [CYKJXUtil getDeviceModel]]];
        self.transId = [CYKJXUtil getDevicePushCode];

        self.token = [[CYKJAccountMemory sharedInstance] token];

    }
    return self;
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}



@end
