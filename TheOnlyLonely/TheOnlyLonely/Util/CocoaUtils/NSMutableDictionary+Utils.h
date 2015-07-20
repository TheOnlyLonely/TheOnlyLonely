//
//  NSMutableDictionary+Utils.h
//  DupiPlanet
//
//  Created by zhaoxy on 14/11/1.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Utils)

/**
 *  就算object为空也不会异常
 *
 *  @param anObject 值
 *  @param aKey     键
 */
- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end
