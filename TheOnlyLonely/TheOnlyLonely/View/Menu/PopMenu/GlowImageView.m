//
//  GlowImageView.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/19.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "GlowImageView.h"

@implementation GlowImageView

/**
 *  设置阴影的颜色
 */
- (void)setGlowColor:(UIColor *)newGlowColor {
    _glowColor = newGlowColor;
    if (newGlowColor) {
        [self setUpProperty];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/**
 *   根据阴影 设置图层 默认属性
 */
- (void)setUpProperty {
    self.layer.shadowColor = self.glowColor.CGColor;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-5, -5, CGRectGetWidth(self.bounds) + 10, CGRectGetHeight(self.bounds) + 10) cornerRadius:(CGRectGetHeight(self.bounds) + 10) / 2.0].CGPath;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowOpacity = 0.5;
    self.layer.masksToBounds = NO;
}
@end
