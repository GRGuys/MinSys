//
//  CYKJResponseHeader.h
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CYKJResponseHeader : JSONModel

@property (nonatomic, assign) NSInteger retcode;
@property (nonatomic, copy) NSString* message;
@property (nonatomic, copy) NSString* restime;
@property (nonatomic, copy) NSString* token;
@property (nonatomic, copy) NSString* sign;

@property(nonatomic ,strong) NSDictionary* data;

@end
