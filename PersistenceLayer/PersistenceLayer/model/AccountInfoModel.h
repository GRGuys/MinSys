//
//  CYKJAccountInfoModel.h
//  PersistenceLayer
//
//  Created by centrin on 16/2/18.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <PersistenceLayer/PersistenceLayer.h>
#import "JSONModel.h"

@interface CYKJAccountInfoModel : JSONModel

@property(nonatomic, strong) NSString* account;

@end
