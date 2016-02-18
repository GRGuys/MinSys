//
//  XUtil.m
//  FrameDemo
//
//  Created by centrin on 16/1/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "XUtil.h"
#import "KeychainItemWrapper.h"
#import "Constants.h"
#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>
#import "sys/utsname.h"
#import "HelperMacro.h"

@implementation CYKJXUtil

static NSDateFormatter* dateFormatter;

static KeychainItemWrapper * sKeychainItem = nil;

+ (NSString*)getDeviceId
{
    NSString * strUUID = nil;
    if (nil == sKeychainItem) {
        sKeychainItem = [[KeychainItemWrapper alloc]
                         initWithIdentifier:KDEVICE_UUID_IDENTIFIER
                         accessGroup:nil];
    }
    
    strUUID = [sKeychainItem objectForKey:(__bridge id)kSecValueData];
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    if ([strUUID isEqualToString:@""])
    {
        NSString* backupId = [ud valueForKey:KDEVICE_ID_BACK_UP];
        if (backupId != nil && backupId.length > 0) {
            strUUID = backupId;
        }else{
            
            CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
            strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
            CFBridgingRelease(uuidRef);
            [sKeychainItem setObject:strUUID forKey:(__bridge id)kSecValueData];
        }
    }
    
    [ud setValue:strUUID forKey:KDEVICE_ID_BACK_UP];
    
    return strUUID;
}


+ (NSString *)getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


+ (NSDateFormatter*)getDateFormatter:(NSString*)aformat
{
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    
    if (dateFormatter != nil && ![dateFormatter.dateFormat isEqualToString:aformat]) {
        [dateFormatter setDateFormat:aformat];
    }
    
    return dateFormatter;
}


+ (NSString *)getCurTimeRandNum
{
    NSString* reqTime = [[self getDateFormatter:@"yyyyMMddhhmmss"] stringFromDate:[NSDate date]];
    int x = arc4random() % 100;
    NSString* srt = [NSString stringWithFormat:@"%@%d", reqTime, x];
    return srt;
}

+ (NSString*)getDeviceSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString*)getDeviceModel
{
    // Gets a string with the device model
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char* machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString* deviceString = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3 (Globa)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (CDMA)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (LTE 4G)";
    
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (Globa)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad mini2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad mini2 (LTE 4G)";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    TTDINFO(@"NOTE: Unknown device type: %@", deviceString);
    return deviceString;
}

+ (NSString*)getDevicePushCode
{
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    return [ud valueForKey:KDEVICE_PUSH_CODE];
}

@end
