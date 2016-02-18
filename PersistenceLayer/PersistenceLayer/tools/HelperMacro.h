//
//  HelperMacro.h
//  CiYunApp
//  存放各种宏工具方法，简写等。
//  Created by huhao on 15/7/6.
//  Copyright (c) 2015年 北京慈云科技有限公司. All rights reserved.
//

#ifndef CiYunApp_HelperMacro_h
#define CiYunApp_HelperMacro_h

//单例简写宏
#pragma mark - 单例简写宏

#undef	ST_SINGLETON
#define ST_SINGLETON \
- (instancetype)sharedInstance; \
+ (instancetype)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON \
- (instancetype)sharedInstance \
{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

//block 循环引用，简写
#pragma mark - block 循环引用，简写

#undef SELF_WEEK
#define SELF_WEEK  __weak __typeof(self)weakSelf = self

#undef SELF_STRONG
#define SELF_STRONG __strong __typeof(weakSelf)strongSelf = weakSelf

//颜色相关简写
#pragma mark - 颜色相关简写

#undef UIColorFromRGB
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#undef UIColorFromRGB_A
#define UIColorFromRGB_A(r, g, b) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0])

//运行时log
#pragma mark - 运行时log
#define TTLOGLEVEL_INFO     5
#define TTLOGLEVEL_WARNING  3
#define TTLOGLEVEL_ERROR    1

#ifdef APP_STORE
#define TTMAXLOGLEVEL 0
#else
#define TTMAXLOGLEVEL 5
#endif

// The general purpose logger. This ignores logging levels.
#ifdef DEBUG
#define TTDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define TTDPRINT(xx, ...)  ((void)0)
#endif // #ifdef DEBUG

// Prints the current method's name.
#define TTDPRINTMETHODNAME() TTDPRINT(@"%s", __PRETTY_FUNCTION__)

// Debug-only assertions.
#ifdef DEBUG

#import <TargetConditionals.h>

#if TARGET_IPHONE_SIMULATOR

#define TTDASSERT(xx) { if (!(xx)) { TTDPRINT(@"TTDASSERT failed: %s", #xx); \
if (TTIsInDebugger()) { __asm__("int $3\n" : : ); }; } \
} ((void)0)
#else
#define TTDASSERT(xx) { if (!(xx)) { TTDPRINT(@"TTDASSERT failed: %s", #xx); } } ((void)0)
#endif // #if TARGET_IPHONE_SIMULATOR

#else
#define TTDASSERT(xx) ((void)0)
#endif // #ifdef DEBUG

// Log-level based logging macros.
#if TTLOGLEVEL_ERROR <= TTMAXLOGLEVEL
#define TTDERROR(xx, ...)  TTDPRINT(xx, ##__VA_ARGS__)
#else
#define TTDERROR(xx, ...)  ((void)0)
#endif // #if TTLOGLEVEL_ERROR <= TTMAXLOGLEVEL

#if TTLOGLEVEL_WARNING <= TTMAXLOGLEVEL
#define TTDWARNING(xx, ...)  TTDPRINT(xx, ##__VA_ARGS__)
#else
#define TTDWARNING(xx, ...)  ((void)0)
#endif // #if TTLOGLEVEL_WARNING <= TTMAXLOGLEVEL

#if TTLOGLEVEL_INFO <= TTMAXLOGLEVEL
#define TTDINFO(xx, ...)  TTDPRINT(xx, ##__VA_ARGS__)
#else
#define TTDINFO(xx, ...)  ((void)0)
#endif // #if TTLOGLEVEL_INFO <= TTMAXLOGLEVEL

#ifdef DEBUG
#define TTDCONDITIONLOG(condition, xx, ...) { if ((condition)) { \
TTDPRINT(xx, ##__VA_ARGS__); \
} \
} ((void)0)
#else
#define TTDCONDITIONLOG(condition, xx, ...) ((void)0)
#endif // #ifdef DEBUG


//静态常量简写
#pragma mark - 静态常量简写

#define S_C_FLOAT static const float
#define S_C_INT static const NSInteger
#define S_C_STRING static NSString * const 

//break简写
#pragma mark - break简写
#define NOWITHBREAK(xx) {if (!(xx)){break;}}
#define YESWITHBREAK(xx) {if ((xx)){break;}}

//VC与Service相互关联简写
#pragma mark - VC与Service相互关联简写
#define VCINTERRELATEDSERVICE(VC, VCProperty, service) \
(VCProperty) = (service); \
(service).delegateVC = VC;

#define VCINTERRELATEDSERVICE_CLASS(VCProperty, ServiceClass) { \
ServiceClass * p__service = [ServiceClass new]; \
(VCProperty) = (p__service); \
(p__service).delegateVC = self;}


//实例化模型对象data数据简写
#pragma mark - 实例化模型对象data数据简写
#define INITMODELDATA - (instancetype)init \
{ \
self = [super init]; \
if (self) { \
NSString * dataClassString = [NSStringFromClass(self.class) stringByReplacingOccurrencesOfString:@"Model" withString:@"Data"]; \
self.data = [NSClassFromString(dataClassString) new]; \
} \
return self; \
}

//实例化Array对象data数据简写
#pragma mark - 实例化模型对象data数据简写
#define INITMODELARRAYDATA - (instancetype)init \
{ \
self = [super init]; \
if (self) { \
self.data = [NSMutableArray new]; \
} \
return self; \
}

#define INITOBJECT_DELEGATE(DelegateClass) { \
id cls_obj  = [[DelegateClass alloc] init]; \
(cls_obj).delegate = self; \
return cls_obj; \
}

#endif
