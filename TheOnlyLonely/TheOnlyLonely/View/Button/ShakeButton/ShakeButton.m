//
//  ShakeButton.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/18.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "ShakeButton.h"

@implementation ShakeButton

+ (instancetype)InitButton
{
    return [self buttonWithType:UIButtonTypeCustom];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self  setup];
    }
    return self;
}


#pragma mark - Private instance methods

- (void)setup
{
    self.backgroundColor = self.tintColor;
    self.layer.cornerRadius = 4.f;
    [self setTitleColor:[UIColor whiteColor]
               forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Avenir-Medium"
                                           size:22];
    
    [self addTarget:self action:@selector(scaleAnimation)
   forControlEvents:UIControlEventTouchUpInside];
}

- (void)scaleAnimation
{
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:CGSizeMake(3.f, 3.f)];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    scaleAnimation.springBounciness = 18.0f;
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    
}

@end
