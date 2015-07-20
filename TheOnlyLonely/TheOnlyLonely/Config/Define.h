//
//  Define.h
//  TheOnlyLove
//
//  Created by 杨毅 on 15/4/3.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#ifndef TheOnlyLonely_Define_h
#define TheOnlyLonely_Define_h

/*---------------------------------------------------*/

//天气预报key
#define WEATHERAPIKEY @"87fd1fc86bcf769415e92e938bb1cb37"
#define appid @"3334"
#define secret @"62dd676883ca4df680e683c028457197"





//pragma mark - Dlog

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define AbstractMethod  NSAssert(NO, @"You must override method '%@' of class '%@'", NSStringFromSelector(_cmd), [self class])

//pragma mark - 定位

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


//pragma mark - 设备型号识别

#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define iOS7                        (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))

//pragma mark - 系统版本

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)



//pragma mark - 颜色

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define HEXRGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



//pragma mark - 消息中心

#define NotificationAddObserver(TITLE, SELECTOR) [[NSNotificationCenter defaultCenter] addObserver:self selector:SELECTOR name:TITLE object:nil]
#define NotificationRemoveObserver(id) [[NSNotificationCenter defaultCenter] removeObserver:id]
#define NotificationPostNotify(TITLE,OBJ,PARAM) [[NSNotificationCenter defaultCenter] postNotificationName:TITLE object:OBJ userInfo:PARAM]

//pragma mark - 内存宏

#ifndef LY_COPY
#if __has_feature(objc_arc)
#define LY_STRONG copy
#else
#define LY_STRONG copy
#endif
#endif

#ifndef LY_STRONG
#if __has_feature(objc_arc)
#define LY_STRONG strong
#else
#define LY_STRONG retain
#endif
#endif

#ifndef LY_WEAK
#if __has_feature(objc_arc_weak)
#define LY_WEAK weak
#elif __has_feature(objc_arc)
#define LY_WEAK unsafe_unretained
#else
#define LY_WEAK assign
#endif
#endif


#endif
