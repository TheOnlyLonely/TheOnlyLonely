//
//  UIButton+Utils.m
//  DupiPlanet
//
//  Created by zhaoxy on 14-9-28.
//  Copyright (c) 2014年 team108. All rights reserved.
//

#import "UIButton+Utils.h"
#import <objc/runtime.h>

@implementation UIButton (Utils)

@dynamic expandInsets;

-(void)setExpandInsets:(UIEdgeInsets)expandInsets {
    NSValue *value = [NSValue value:&expandInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, @"expandInsets", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)expandInsets {
    NSValue *value = objc_getAssociatedObject(self, @"expandInsets");
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.expandInsets, UIEdgeInsetsZero) ||       !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.expandInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}

@end
