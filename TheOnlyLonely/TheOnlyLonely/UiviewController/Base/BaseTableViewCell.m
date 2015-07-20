//
//  BaseTableViewCell.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/18.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self InitCell];
    }
    return self;
}

- (void)InitCell
{
    //初始化cell
}

- (void)custiomUI
{
    self.textLabel.textColor = [UIColor customGrayColor];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textLabel.font = [UIFont fontWithName:@"Avenir-Light" size:20];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 0.1;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness = 20.f;
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}
@end
