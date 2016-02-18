//
//  XUtil.h
//  FrameDemo
//
//  Created by centrin on 16/1/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CYKJXUtil : NSObject

/**
 *  日期格式化
 *
 *  @param aformat 格式
 *
 *  @return 格式器
 */
+ (NSDateFormatter*)getDateFormatter:(NSString*)aformat;

/**
 *  当前时分秒+随机数
 *
 *  @return 随机码
 */
+ (NSString*)getCurTimeRandNum;

/**
 *  当前应用版本号
 *
 *  @return 版本号
 */
+ (NSString*)getAppVersion;

/**
 *  设备标识
 *
 *  @return 设备号
 */
+ (NSString*)getDeviceId;

/**
 *  设备系统版本
 *
 *  @return IOS版本号
 */
+ (NSString*)getDeviceSystemVersion;

/**
 *  获取手机设备型号
 *
 *  @return 设备型号
 */
+ (NSString*)getDeviceModel;

/**
 *  获取设备推送标识
 *
 *  @return 推送标识
 */
+ (NSString*)getDevicePushCode;

@end
