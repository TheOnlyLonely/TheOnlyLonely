//
//  NSString+Utils.h
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-8.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Regex)

//手机号码验证
- (BOOL)validateMobile;
//邮箱验证
- (BOOL)validateEmail;
//昵称验证
- (BOOL)validateNickName;

@end

@interface NSString (md5)

- (NSString *)md5;

@end

@interface NSString (Utils)

/**
 *  计算中英文混合字符串的长度，两个英文字母的长度为1
 *
 *  @return 长度
 */
- (float)mixLength;

- (float) heightForString:(NSString *)value fontSize:(UIFont*)fontSize andWidth:(float)width;



@end