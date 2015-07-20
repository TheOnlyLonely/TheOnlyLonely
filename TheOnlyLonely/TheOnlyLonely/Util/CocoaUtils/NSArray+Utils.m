//
//  NSArray+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-14.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index<[self count]) {
        return [self objectAtIndex:index];
    }else {
        return nil;
    }
}

@end
