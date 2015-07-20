//
//  NSDictionary+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-26.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "NSDictionary+Utils.h"


@implementation NSDictionary (Utils)

- (BOOL)boolForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj boolValue];
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return NO;
    }
}

- (int)intForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj intValue];
    }else {
        if (obj) {
           NSLog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (float)floatForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj floatValue];
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (long)longForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj longValue];
    }else {
        if (obj) {
           NSLog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (double)doubleForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSNumber class]] || [obj isKindOfClass:[NSString class]]) {
        return [obj doubleValue];
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return 0;
    }
}

- (NSDictionary *)dictionaryForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return obj;
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSArray *)arrayForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSArray class]]) {
        return obj;
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSString *)stringForKey:(id)aKey {
    id obj = [self objectForKey:aKey];
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }else {
        if (obj) {
            NSLog(@"the key %@ of dic is error", aKey);
        }
        return nil;
    }
}

- (NSString *)safeStringForKey:(id)aKey {
    NSString *str = [self stringForKey:aKey];
    if (!str) {
        str = @"";
    }
    return str;
}

@end
