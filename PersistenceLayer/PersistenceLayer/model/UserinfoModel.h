//
//  UserinfoModel.h
//  FrameDemo
//
//  Created by centrin on 16/1/22.
//  Copyright © 2016年 ciyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface CYKJUserinfoModel : JSONModel

@property(nonatomic ,copy)NSString *  userid;       // 用户在慈云系统的唯一标示
@property(nonatomic ,copy)NSString *  personId;     // 用户在慈云系统的唯一标示
@property(nonatomic ,copy)NSString *  loginname;    // 用户登陆名
@property(nonatomic ,copy)NSString *  name;         // 用户名
@property(nonatomic ,assign)NSInteger   isauth;       // 是否认证用户 1-是 2-否
@property(nonatomic ,assign)NSInteger   issurveyed;   // 是否已完成问卷调查 1-未完成  2-已完成
@property(nonatomic ,assign)NSInteger   sex;          // 1-男   2-女 3-未知
@property(nonatomic ,copy)NSString *  birth;        // 出生日期 格式yyyy-mm-dd
@property(nonatomic ,assign)NSInteger   height;       // 身高
@property(nonatomic ,assign)NSInteger   cardtype;     // 证件类型  1-身份证2-回乡证 3-护照4-军官证 5-其他没有证件号的，类型填0
@property(nonatomic ,copy)NSString *   cardid;       // 证件号
@property(nonatomic ,copy)NSString *   mobile;       // 手机号
@property(nonatomic ,copy)NSString *   email;        // 邮件地址
@property(nonatomic ,copy)NSString *   corpname;     // 用户所属企业的名称
@property(nonatomic ,copy)NSString *   head;         // 用户头像地址
@property(nonatomic ,copy)NSString *   nickname;     // 用户昵称
@property(nonatomic ,assign)NSInteger    points;       // 用户积分
@property(nonatomic ,assign)NSInteger    vipFlag;      // 1普通会员 2 vip会员 3 至尊VIP
@property(nonatomic ,copy)NSString *   failTime;     // YYYY-MM-DD
@property(nonatomic ,assign)NSInteger    healthScore;  // 健康评分
@property(nonatomic ,copy)NSString *   regTime;      // YYYY-MM-DD HH:MM:SS
@property(nonatomic ,assign)NSInteger    isQues;  // 是否做过问卷调查 1-是 2-否
@property(nonatomic ,assign)NSInteger    isSet;  // 是否选择过健管师 1-是 2-否

@end
