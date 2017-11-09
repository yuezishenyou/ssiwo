//
//  Common.h
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#ifndef Common_h
#define Common_h



#define kScreenH     ([UIScreen mainScreen].bounds.size.height)
#define kScreenW     ([UIScreen mainScreen].bounds.size.width)
#define kBili        ([[UIScreen mainScreen]bounds].size.width / 375.0)
#define KNavigationH (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication]statusBarFrame].size.height)
#define kNavH        (self.navigationController.navigationBar.frame.size.height)
#define kStatusH     ([[UIApplication sharedApplication]statusBarFrame].size.height)


#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

#define headerPath  [NSString stringWithFormat:@"%@/HeaderImage.jpeg", kDocumentPath]




#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

/**
 * 屏幕尺寸size
 */
#define kScreenSize ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale, [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)


//判断是不是ipad 还是iphone
#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


/**
 * 判断系统版本
 */
#define kIS_IOS7 ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)

#define kIS_IOS8 ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)

#define kIS_IOS9 ([[[UIDevice currentDevice] systemVersion] intValue] >= 9)

// 6S宽高比例
#define WIDTH_6S_SCALE 375.0 * [UIScreen mainScreen].bounds.size.width
#define HEIGHT_6S_SCALE 667.0 * [UIScreen mainScreen].bounds.size.height

/**
 * 是否为空字符串
 */
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)

/**
 * 是否为空数组
 */
#define kArrayIsEmpty(array) ([array isKindOfClass:[NSNull class]] || array == nil || array.count == 0)

/**
 * 是否为空子典
 */
#define kDictIsEmpty(dict) ([dict isKindOfClass:[NSNull class]] || dict == nil || dict.allKeys.count == 0)

/**
 * 是否为空对象
 */
#define kObjectIsEmpty(_object) ([_object isKindOfClass:[NSNull class]] || _object == nil || ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) || ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

/**
 * 获取App版本号
 */
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**
 * keyWindow
 */
#define kEY_WINDOW  [[UIApplication sharedApplication]keyWindow]

/**
 * NSUserDefault 存 BOOL 值
 */
#define kYDD_USERDEFAULTS_SET_BOOL(bo,key) [[NSUserDefaults standardUserDefaults] setBool:bo forKey:key]
/**
 * NSUserDefault 获取 BOOL 值
 */
#define kYDD_USERDEFAULTS_READ_BOOL(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]

/**
 * NSUserDefault 存 object
 */
#define kYDD_USERDEFAULTS_SET_OBJ(obj,key) [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key]

/**
 * NSUserDefault 获取 object
 */
#define kYDD_USERDEFAULTS_READ_OBJ(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

/**
 * NSUserDefault 立即写入数据
 */
#define kYDD_USERDEFAULTS_SYN [[NSUserDefaults standardUserDefaults] synchronize]

/**
 *
 *  发送通知
 */

#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]


/**
 * 获取沙盒Document路径
 */
#define kDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]



/**
 * RGB 颜色
 */
#define kRGBA(r,g,b,a)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:a]

#define kRGB(r,g,b)  [UIColor colorWithRed:(double)r/255.0f green:(double)g/255.0f blue:(double)b/255.0f alpha:1.0]

/**
 * 默认颜色
 */
#define kRGBNomal  [UIColor colorWithRed:204/255.0f green:149/255.0f blue:91/255.0f alpha:1.0]
#define kRGBLight  [UIColor colorWithRed:204/255.0f green:149/255.0f blue:91/255.0f alpha:0.6]



/**
 * 弱引用
 */
#define kWeakSelf(type) __weak typeof(type) weak##type = type;

/**
 * 强引用
 */
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

//通用字号
#define DEF_FontSize_20 [UIFont systemFontOfSize:20]
#define DEF_FontSize_18 [UIFont systemFontOfSize:18]
#define DEF_FontSize_17 [UIFont systemFontOfSize:17]
#define DEF_FontSize_16 [UIFont systemFontOfSize:16]
#define DEF_FontSize_14 [UIFont systemFontOfSize:14]
#define DEF_FontSize_15 [UIFont systemFontOfSize:15]
#define DEF_FontSize_13 [UIFont systemFontOfSize:13]
#define DEF_FontSize_12 [UIFont systemFontOfSize:12]
#define DEF_FontSize_11 [UIFont systemFontOfSize:11]
#define DEF_FontSize_10 [UIFont systemFontOfSize:10]
#define DEF_FontSize_9  [UIFont systemFontOfSize:9]

#endif /* Common_h */








#ifdef DEBUG

/**
 * 打印数据
 */
# define DLog(fmt, ...) NSLog((@"\n\t[文件名:%s]\n""\t[函数名:%s]\n""\t[行号:%d] \n""\t[打印:" fmt "]\n\n"), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#define DLogInfo(...) NSLog(__VA_ARGS__);

#else
# define DLog(...);
# define DLogInfo(...)
#endif

#ifdef DEBUG

#define NSSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSSLog(...)

#endif




