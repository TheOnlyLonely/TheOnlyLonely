//
//  NSString+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-8.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Regex)

- (BOOL)validateMobile
{
    //手机号以1开头，十个 \d 数字字符
    NSString *phoneRegex = @"^(1)\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)validateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)validateNickName {
    NSString *nickNameRegex = @"^[^0-9].*";
    NSPredicate *nickNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nickNameRegex];
    return [nickNameTest evaluateWithObject:self];
}

@end


@implementation NSString (md5)

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

@end

@implementation NSString (Utils)

- (float)mixLength {
    int length = 0;
    char *p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++) {
        if (*(p++)) {
            length++;
        }
    }
    return length/2.0f;
}

- (float) heightForString:(NSString *)value fontSize:(UIFont*)fontSize andWidth:(float)width
{
    CGRect tmpRect = [value boundingRectWithSize:CGSizeMake(width,CGFLOAT_MAX)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:[NSDictionary dictionaryWithObjectsAndKeys:fontSize,NSFontAttributeName, nil]
                                         context:nil];
    return tmpRect.size.height;
}



@end
