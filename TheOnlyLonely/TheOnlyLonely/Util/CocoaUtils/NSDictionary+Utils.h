//
//  NSDictionary+Utils.h
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-26.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utils)

/**
 *  如果值不存在或类型不正确则返回空字符串
 *
 *  @param aKey 键
 *
 *  @return 字符串
 */
- (NSString *)safeStringForKey:(id)aKey;

- (BOOL)boolForKey:(id)aKey;
- (int)intForKey:(id)aKey;
- (float)floatForKey:(id)aKey;
- (long)longForKey:(id)aKey;
- (double)doubleForKey:(id)aKey;
- (NSDictionary *)dictionaryForKey:(id)aKey;
- (NSArray *)arrayForKey:(id)aKey;
- (NSString *)stringForKey:(id)aKey;

@end
