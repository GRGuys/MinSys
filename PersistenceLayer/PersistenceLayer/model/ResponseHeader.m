//
//  CYKJResponseHeader.m
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "ResponseHeader.h"
#import "XUtil.h"

@implementation CYKJResponseHeader

+ (BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

- (void)setRestime:(NSString *)restime
{
    NSDateFormatter* format = [CYKJXUtil getDateFormatter:@"yyyyMMddHHmmss"];
    NSDate* date = [format dateFromString:restime];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    _restime = [format stringFromDate:date];
}

@end
