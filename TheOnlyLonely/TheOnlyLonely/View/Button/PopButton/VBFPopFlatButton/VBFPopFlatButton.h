//
//  VBFSegmentButton.h
//  VBFMaterialPopButton
//
//  Created by Victor Baro on 16/08/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import <UIKit/UIKit.h>

@interface VBFPopFlatButton : UIButton

typedef NS_ENUM(NSInteger, FlatButtonType) {
    buttonDefaultType,             // Vertical line
    buttonAddType,                 // +
    buttonMinusType,               // -
    buttonCloseType,               // x
    buttonBackType,                // <
    buttonForwardType,             // >
    buttonMenuType,                 // 3horizontal lines
    buttonDownloadType,
    buttonShareType
};

typedef NS_ENUM(NSInteger, FlatButtonStyle) {
    buttonPlainStyle,
    buttonRoundedStyle
};

@property (nonatomic) FlatButtonType currentButtonType;
@property (nonatomic) FlatButtonStyle currentButtonStyle;

//BackgroundColor property for rounded style button only
@property (nonatomic, strong) UIColor *roundBackgroundColor;

@property (nonatomic) CGFloat lineThickness;
@property (nonatomic) CGFloat lineRadius;
@property (nonatomic, strong) UIColor *linesColor __deprecated_msg("Deprecated in favor of the tintColor property.");

- (void)setTintColor:(UIColor *)tintColor forState:(UIControlState)state;
- (UIColor *)tintColorForState:(UIControlState)state;

- (instancetype)initWithFrame:(CGRect)frame
                  buttonType:(FlatButtonType)initType
                  buttonStyle:(FlatButtonStyle)bStyle;

- (void)animateToType:(FlatButtonType)finalType;

@end
