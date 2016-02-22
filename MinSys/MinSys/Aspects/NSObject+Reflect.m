//
//  NSObject+Reflect.m
//  PersistenceLayer
//
//  Created by centrin on 16/2/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "NSObject+Reflect.h"
#import <objc/runtime.h>

@implementation NSObject (Reflect)



- (NSArray*)propertyKeys
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    
    free(properties);
    
    return keys;
}


- (BOOL)reflectDataFromOtherObject:(NSObject*)dataSource
{
    BOOL ret = NO;
    for (NSString *key in [self propertyKeys]) {
        if ([dataSource isKindOfClass:[NSDictionary class]]) {
            ret = ([dataSource valueForKey:key]==nil)?NO:YES;
        }
        else
        {
            ret = [dataSource respondsToSelector:NSSelectorFromString(key)];
        }
        
        if (ret) {
            id propertyValue = [dataSource valueForKey:key];
            //该值不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
                [self setValue:propertyValue forKey:key];
            }
        }
    }
    
    return ret;
}

- (BOOL)propInitSelf:(Class)parentClass
{
    BOOL ret = NO;
//    for (NSString *key in [self propertyKeys]) {
//        
//        if ([key isKindOfClass:parentClass]) {
//            Class cls = NSClassFromString(key);
//            id propertyValue = [[cls alloc] init];
//            
//            //该值不为NSNULL，并且也不为nil
//            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
//                [self setValue:propertyValue forKey:key];
//            }
//        }
//        
//    }
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
//        NSString* name = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
//        NSString* clsName = [[NSString alloc] initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *clsName = [NSString stringWithUTF8String:property_getAttributes(property)];
        
        NSArray* ary = [clsName componentsSeparatedByString:@","];
        clsName = ary[0];
//        clsName = [clsName stringByReplacingOccurrencesOfString:@"[(T@)\"\\]" withString:@""];
        
        NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:
                                                  
                                                  @"[(T@\")(\")]+" options:0 error:nil];
        
        clsName  = [regularExpression stringByReplacingMatchesInString:clsName options:0 range:NSMakeRange(0, clsName.length) withTemplate:@""];
        
        Class cls = NSClassFromString(clsName);
        if ([cls isSubclassOfClass:parentClass] || [cls isKindOfClass:parentClass]) {
            id propertyValue = [[cls alloc] init];
            
            //该值不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
                [self setValue:propertyValue forKey:name];
                [self setValue:self forKeyPath:[NSString stringWithFormat:@"%@.delegate", name]];
            }
        }
    }
    
    free(properties);
    
    return ret;
}


@end
