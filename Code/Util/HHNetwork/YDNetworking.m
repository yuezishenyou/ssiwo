//
//  YDNetworking.m
//  HH_Entity
//
//  Created by maoziyue on 17/6/2.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "YDNetworking.h"
#import "MJExtension.h"
#import "YDNetWork.h"
#import "DejNetwork.h"
#import <AFNetworking.h>


@implementation YDNetworking

//+ (void)postGetVaildPhoneWithDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDVaildPhoneModel *model,NSError *error))block;
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/isExist"];
//
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDVaildPhoneModel *model = [YDVaildPhoneModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//+ (void)postGetAuthCodeDictionary:(NSDictionary *)dic resultBlock:(void(^)(YDAuthCodeModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/getVCode"];
//    [YDNetWork POST:url parameters:dic success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDAuthCodeModel *model = [YDAuthCodeModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//
//
//
//+ (void)postGetRegistDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDRegisterModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/reg"];
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDRegisterModel *model = [YDRegisterModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//
//+ (void)postGetLoginPassDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLoginModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/login"];
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDLoginModel *model = [YDLoginModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//+ (void)postGetLoginCodeDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLoginModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/loginsms"];
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDLoginModel *model = [YDLoginModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//+ (void)postGetLoginDictionary:(NSDictionary *)dict loginMode:(NSInteger)loginMode resultBlock:(void(^)(YDLoginModel *model,NSError *error))block
//{
//    if (loginMode == 0)
//    {
//        NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/loginsms"];
//        [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//            NSLog(@"---responseBody:%@---",responseBody);
//            YDLoginModel *model = [YDLoginModel mj_objectWithKeyValues:responseBody];
//            block(model,nil);
//        } failure:^(NSError *error) {
//            NSLog(@"---xxx---");
//            block(nil,error);
//        }];
//    }
//    else
//    {
//        NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/login"];
//        [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//            NSLog(@"---responseBody:%@---",responseBody);
//            YDLoginModel *model = [YDLoginModel mj_objectWithKeyValues:responseBody];
//            block(model,nil);
//        } failure:^(NSError *error) {
//            NSLog(@"---xxx---");
//            block(nil,error);
//        }];
//    }
//}
//
//
//
//
//+ (void)postGetUserInfoDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDUserInfoModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/getUserInfo"];
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDUserInfoModel *model = [YDUserInfoModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}
//
//
//
//+ (void)postGetLogoutDictionary:(NSDictionary *)dict resultBlock:(void(^)(YDLogoutModel *model,NSError *error))block
//{
//    NSString *url = [NSString stringWithFormat:@"%@%@",GATEWAY,@"/user/logout"];
//    [YDNetWork POST:url parameters:dict success:^(id responseBody) {
//        NSLog(@"---responseBody:%@---",responseBody);
//        YDLogoutModel *model = [YDLogoutModel mj_objectWithKeyValues:responseBody];
//        block(model,nil);
//    } failure:^(NSError *error) {
//        NSLog(@"---xxx---");
//        block(nil,error);
//    }];
//}






+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dict resultBlock:(void(^)(id data,NSError *error))block
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
    
                                                             @"text/html",
    
                                                             @"image/jpeg",
    
                                                             @"image/png",
    
                                                             @"application/octet-stream",
    
                                                             @"text/json",
    
                                                             nil];
    
        manager.requestSerializer= [AFHTTPRequestSerializer serializer];
    
        manager.responseSerializer= [AFHTTPResponseSerializer serializer];
    
        NSString *url = [NSString stringWithFormat:@"%@?sid=2008&token=%@", @"http://114.215.208.42:8098/h_way/gate", dict[@"token"]];
    
    
        [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
            NSData *picture = UIImageJPEGRepresentation(image, 0.5);
            
            [formData appendPartWithFileData:picture name:@"photoPath" fileName:@"photo.jpg" mimeType:@"photo/jpg"];
    
        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
    
            NSLog(@"----sid:%@----code:%@------",json[@"sid"],json[@"status"][@"code"]);
            if (block) {
                block(json,nil);
            }
    
        
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
            if (block) {
                block(nil,error);
            }
    
        }];
    
    

}

















@end


























/**
 * 2008
 * 修改头像
 */

//+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dict resultBlock:(void(^)(void))block
//{
//
//}

//+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dic resltBlock:(void (^)(void))block
//{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//
//                                                         @"text/html",
//
//                                                         @"image/jpeg",
//
//                                                         @"image/png",
//
//                                                         @"application/octet-stream",
//
//                                                         @"text/json",
//
//                                                         nil];
//
//    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
//
//    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
//
//    NSString *url = [NSString stringWithFormat:@"%@?sid=2008&token=%@", GATEWAY, dic[@"token"]];
//
//
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        NSData *picture = UIImageJPEGRepresentation(image, 0.5);
//        [formData appendPartWithFileData:picture name:@"photoPath" fileName:@"photo.jpg" mimeType:@"photo/jpg"];
//
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//
//        NSLog(@"----%@----%@------",json[@"sid"],json);
//
//        YDUpLoadModel *enti = [YDUpLoadModel mj_objectWithKeyValues:responseObject];
//
//        if (block) {
//            block(enti,nil);
//        }
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        if (block) {
//            block(nil,error);
//        }
//
//    }];
//}


//+ (void)changHeaderImageWihtImage:(UIImage *)image dictionary:(NSDictionary *)dic resltBlock:(void (^)(YDUpLoadModel *model, NSError *error))block
//{
//
//
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
//
//                                                         @"text/html",
//
//                                                         @"image/jpeg",
//
//                                                         @"image/png",
//
//                                                         @"application/octet-stream",
//
//                                                         @"text/json",
//
//                                                         nil];
//
//    manager.requestSerializer= [AFHTTPRequestSerializer serializer];
//
//    manager.responseSerializer= [AFHTTPResponseSerializer serializer];
//
//    NSString *url = [NSString stringWithFormat:@"%@?sid=2008&token=%@", GATEWAY, dic[@"token"]];
//
//
//    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        NSData *picture = UIImageJPEGRepresentation(image, 0.5);
//        [formData appendPartWithFileData:picture name:@"photoPath" fileName:@"photo.jpg" mimeType:@"photo/jpg"];
//
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//
//        NSLog(@"----%@----%@------",json[@"sid"],json);
//
//        YDUpLoadModel *enti = [YDUpLoadModel mj_objectWithKeyValues:responseObject];
//
//        if (block) {
//            block(enti,nil);
//        }
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        if (block) {
//            block(nil,error);
//        }
//
//    }];
//
//}









