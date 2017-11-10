//
//  YDSelectPhoto.h
//  YDClient
//
//  Created by maoziyue on 2017/11/3.
//  Copyright © 2017年 YD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SelectPhotoType){
    SelectPhotoTypeCamera = 0,
    SelectPhotoTypeAlbum,
};


@protocol YDSelectPhotoDelegate <NSObject>
@optional
//照片选取成功
- (void)selectPhotoManagerDidFinishImage:(UIImage *)image;
//照片选取失败
- (void)selectPhotoManagerDidError:(NSError *)error;

@end


@interface YDSelectPhoto : NSObject

@property(nonatomic, weak) id<YDSelectPhotoDelegate>delegate;
//是否开启照片编辑功能
@property(nonatomic, assign)BOOL canEditPhoto;

//跳转的控制器 可选参数
@property(nonatomic, weak) UIViewController *superVC;


//照片选取成功回调
@property(nonatomic, strong)void (^successHandle)(YDSelectPhoto *manager, UIImage *image);

//照片选取失败回调 0-取消 1-没有相机权限 2-没有相册权限 3-没有摄像头
@property(nonatomic, strong)void (^errorHandle)(NSString *error);


//开始选取照片
- (void)startSelectPhotoWithImageName:(NSString *)imageName;

- (void)startSelectPhotoWithType:(SelectPhotoType )type andImageName:(NSString *)imageName;



@end
