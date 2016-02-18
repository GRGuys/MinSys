//
//  AccountMemory.h
//  FrameDemo
//
//  Created by centrin on 16/1/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelperMacro.h"
#import "UserinfoModel.h"

@interface CYKJAccountMemory : NSObject

@property (nonatomic, strong) CYKJUserinfoModel* user;
@property (nonatomic, strong) NSString* token;

ST_SINGLETON

@end
