//
//  StorageFile.h
//  PersistenceLayer
//
//  Created by centrin on 16/2/21.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYKJStorageFile : NSObject

+ (void)writeOffLineDataWithModule:(NSString*)module dataStr:(NSString *)dataString AndUserId:(NSString *)userId;
+ (NSString *)readOffLineDataWithModule:(NSString*)module userId:(NSString *)userId;

@end
