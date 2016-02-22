//
//  NSObject+Reflect.h
//  PersistenceLayer
//
//  Created by centrin on 16/2/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Reflect)

- (BOOL)propInitSelf:(Class)parentClass;

@end
