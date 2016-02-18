//
//  CYKJRequestHeader.h
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CYKJRequestHeader : JSONModel

@property(nonatomic ,copy) NSString * version;
@property(nonatomic ,copy) const NSString * cmd;
@property(nonatomic ,copy) NSString * appId;
@property(nonatomic ,copy) NSString * restime;
@property(nonatomic ,copy) NSString * token;
@property(nonatomic ,copy) NSString * transId;
@property(nonatomic ,copy) NSString * uuid;

@property(nonatomic ,strong) NSDictionary* data;

@end
