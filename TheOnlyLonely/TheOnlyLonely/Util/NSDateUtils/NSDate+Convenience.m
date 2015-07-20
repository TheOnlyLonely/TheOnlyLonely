//
//  NSDate+Convenience.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/15.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "NSDate+Convenience.h"

@implementation NSDate (Convenience)

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format {
    if (!format)
        format = @"yyyy-MM-dd";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format {
    if (date==nil){
        return @"";
    }
    if (!format)
        format = @"yyyy-MM-dd";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}




@end
