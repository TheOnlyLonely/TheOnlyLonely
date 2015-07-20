//
//  NSMutableDictionary+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14/11/1.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "NSMutableDictionary+Utils.h"

@implementation NSMutableDictionary (Utils)

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!anObject) {
        return;
    }
    [self setObject:anObject forKey:aKey];
}

@end
