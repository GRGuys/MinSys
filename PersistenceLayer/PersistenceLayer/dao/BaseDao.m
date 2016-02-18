//
//  BaseDao.m
//  FrameDemo
//
//  Created by centrin on 16/1/20.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import "BaseDao.h"
#import "AFNetworking.h"
#import "HelperMacro.h"
#import "Constants.h"
#import "RequestHeader.h"

#define REQUEST_SUCCESS 1
#define REQUEST_FAIL 0

static AFHTTPRequestOperationManager * operationManager;

@implementation CYKJBaseDao

- (instancetype)init
{
    self = [super init];
    if (self) {
        operationManager = [self getOperationManager];
    }
    return self;
}


- (AFHTTPRequestOperationManager*)getOperationManager
{
    if (operationManager == nil) {
        operationManager =  [[AFHTTPRequestOperationManager alloc] init];
        operationManager.requestSerializer=[AFJSONRequestSerializer serializer];
    }
    return operationManager;
}

- (void)requestWithCommand:(NSString*)acmd parameter:(NSDictionary*)arequestDic
{
    if (acmd.length == 0) {
        TTDERROR(@"请求参数错误，缺少命令字cmd");
        return;
    }
    
    CYKJRequestHeader* requestHeaher = [[CYKJRequestHeader alloc] init];
    requestHeaher.cmd = acmd;
    requestHeaher.data = arequestDic;
    
    
    __block NSString * aCommand = [requestHeaher.cmd copy];
    TTDINFO(@"请求地址：%@ \n请求参数：%@", kServerHost, requestHeaher.toDictionary);
    [operationManager POST:(NSString *)kServerHost parameters:requestHeaher.toDictionary success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        [self responseWithCmd:aCommand data:responseObject status:REQUEST_SUCCESS error:nil];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        [self responseWithCmd:aCommand data:nil status:REQUEST_FAIL error:error];
    }];
    
}

- (void)responseWithCmd:(NSString*)aCmd data:(NSDictionary*)responseDic status:(NSInteger)astatus error:(NSError*)aerror
{
    NSError* transformError = nil;
    CYKJResponseHeader* respObj = [[CYKJResponseHeader alloc] initWithDictionary:responseDic error:&transformError];
    
//    NSString* msg = [NSString stringWithUTF8String:[respObj.message UTF8String]];
    TTDINFO(@"请求接口：%@，返回消息：%@ \n 异常：%@", aCmd, respObj.message, aerror);
    
    if (astatus == NSRetCodeValue_Success || astatus == NSRetCodeValue_NoData) {
//        [self.delegate responseDaoSuccess:responseModel];
    }else{
//        [self.delegate responseDaoFail:responseModel];
    }
}


- (void)requestWithCommand:(NSString *)acmd parameter:(NSDictionary *)arequestDic success:(void (^)(id))success failure:(void (^)(id))failure
{
    if (acmd.length == 0) {
        TTDERROR(@"请求参数错误，缺少命令字cmd");
        return;
    }
    
    CYKJRequestHeader* requestHeaher = [[CYKJRequestHeader alloc] init];
    requestHeaher.cmd = acmd;
    requestHeaher.data = arequestDic;
    
    TTDINFO(@"请求地址：%@ \n请求参数：%@", kServerHost, requestHeaher.toDictionary);
    [operationManager POST:(NSString *)kServerHost parameters:requestHeaher.toDictionary success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         CYKJResponseHeader* respObj = [[CYKJResponseHeader alloc] initWithDictionary:responseObject error:nil];
         TTDINFO(@"请求接口成功：%@，返回数据：%@ ", acmd, respObj.message);
         success(responseObject);
     }
       failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         TTDINFO(@"请求接口失败：%@，异常信息：%@", acmd, error);
         failure(error);
     }];
}


@end
