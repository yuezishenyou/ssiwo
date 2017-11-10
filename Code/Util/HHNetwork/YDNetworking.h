//
//  YDNetworking.h
//  HH_Entity
//
//  Created by maoziyue on 17/6/2.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "UserEntity.h"



@interface YDNetworking : NSObject




///**
// * 1.判断手机号是否已经被注册
// /user/isExist?phone=17612161504
// */
//+ (void)postGetVaildPhoneWithDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;
//
//
///**
// * 2.获取短信验证码
// /user/getVCode?phone=17612161504
// */
//+ (void)postGetAuthCodeDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDAuthCodeModel *model,NSError *error))block;
//
//
///**
// * 3.注册
// /user/reg?phone=17612161504&password=yd123456&vcode=817796
// */
//+ (void)postGetRegistDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDRegisterModel *model,NSError *error))block;
//
//// 0 验证码 ， 1 密码
//+ (void)postGetLoginDictionary:(NSDictionary *)dict loginMode:(NSInteger)loginMode resultBlock:(void(^)(YDLoginModel *model,NSError *error))block;
//
//
//
///**
// * 4.登录
// /user/login?phone=17612161504&password=yd123456
// */
//+ (void)postGetLoginPassDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLoginModel *model,NSError *error))block;
//
//
//
///**
// * 5.使用短信验证码快速登录
// /user/loginsms?phone=17612161504&vcode=064675
// */
//+ (void)postGetLoginCodeDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLoginModel *model,NSError *error))block;
//
//
///**
// * 6.获取用户信息
// /user/getUserInfo?token=c23bbc67-0445-4710-8381-abb4888ef179
// */
//+ (void)postGetUserInfoDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDUserInfoModel *model,NSError *error))block;



///**
// * 7.找回密码 暂时不要
// /user/findPassword?phone=17612161504&vcode=265845
// */
//+ (void)postGetDictionary7:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;
//
//
//
///**
// * 8.找回密码 暂时不要
// /user/resetPassword?phone=17612161504&vcode=265845&password=newpwd
// */
//+ (void)postGetDictionary8:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;
//
//
//
///**
// * 9.修改用户信息(post)
// /user/updateUserInfo
// {
// "id": 3,
// "phone": "17612161504",
// "password": "gk123456",
// "name": "Chris Chen",
// "vcode": null,
// "token": "662d51f8-0521-428f-9022-eca1e82fe0cf",
// "wsToken": null
// }
// */
//+ (void)postGetDictionary9:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;
//
//
//
///**
// * 10.修改用户信息（协议测试）暂时不要
// 此接口提供规范协议包装的RequestBody请求模式，期待那un可以用这个api进行调用测试。
// /user/modifyUserInfo
// {
// "protocol": {
// "ver": "1.0",
// "channel": "mi",
// "os": "android",
// "token": "f23c171a-0844-4482-926d-1dddb030bfc0",
// "lng": 120.6354125525,
// "lat": 33.2665855233
// },
// "params": {
// "id": 3,
// "phone": "17612161504",
// "password": "gk123456",
// "name": "Chris Chen",
// "token": "f23c171a-0844-4482-926d-1dddb030bfc0"
// }
// }
// */
//+ (void)postGetDictionary10:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;



/**
 * 11.退出登录
 /user/logout?token=f23c171a-0844-4482-926d-1dddb030bfc0
 */
//+ (void)postGetLogoutDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLogoutModel *model,NSError *error))block;






























/**
 *
 * 修改头像
 */
+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dict resultBlock:(void(^)(id data,NSError *error))block;












@end
