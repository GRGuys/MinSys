//
//  Constants.h
//  FrameDemo
//
//  Created by centrin on 16/1/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define kServerHost  @"http://api.lovehealth.com.cn/CiyunService" //测试服务器URL

#define KDEVICE_UUID_IDENTIFIER @"com.zj.useruuid"
#define KDEVICE_ID_BACK_UP @"deviceIdBackup"
#define KDEVICE_PUSH_CODE @"devicePushCode"

#define KSTORAGEFILE_LOGIN_INFO @"storageFile_login_info"


#define KNOTIFICATION_ACCOUNT_UPDATE @"ntf_account_update"



typedef NS_ENUM(NSUInteger, NSRetCodeValue)
{
    NSRetCodeValue_Error          = 105,  // 异常
    NSRetCodeValue_NoNetwork      = 106,  // 无网络
    
    NSRetCodeValue_Success        = 0,    //请求成功
    NSRetCodeValue_Token          = 200,  //token失效,请重新登录
    NSRetCodeValue_TokenNull      = 58,   //token为空
    NSRetCodeValue_InvalidLogin   = 38,   //非法访问，请重新登录
    NSRetCodeValue_LoginNameExist = 19,   //注册接：登录名已存在
    NSRetCodeValue_PasswordError  = 3,    //密码错误
    NSRetCodeValue_NoData         = 17,   //无数据
    
    NSChangePwd_ErrorPwd =14,//旧密码不正确
    NSNoContent_Code = 17,//咨询栏目下无内容 61
    NSNoActivity_Code = 17,//无活动 75
    NSNoTopicSection_Code = 17,//无板块 76
    NSNoTalkAbout_Code = 17,//无话题 77
    NSNoLoopPic_Code = 17,//无轮播图 79
    NSCompletionPN_Code = 87, //登录成功,只需要补全手机号
    
    NSRequestNoData_Code = 17, //请求接口返回无数据
    NSHealthPlanData_Code = 17,
    
    NSDeviceIsNotBind    =  505,  //设备未绑定
    NSDeviceHadBound    =  91,  //设备未绑定
    NSNoDataInMeasureList = 72,
};

#endif /* Constants_h */
