//
//  VBFDoubleSegment.m
//  VBFMaterialPopButton
//
//  Created by Victor Baro on 31/07/2014.
//  Copyright (c) 2014 Victor Baro. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "VBFDoubleSegment.h"
#import "POP.h"

@interface VBFDoubleSegment ()
@property (nonatomic) CGFloat totalLength;
@property (nonatomic, strong) CAShapeLayer *topLine;
@property (nonatomic, strong) CAShapeLayer *bottomLine;
@property (nonatomic) CGFloat topAnchorPoint;
@end

@implementation VBFDoubleSegment

- (instancetype)init {
    return [self initWithLength:20 thickness:2 radius:0 color:[UIColor whiteColor] initialState:doubleSegmentDefaultState];
}

- (instancetype)initWithLength:(CGFloat)length
           thickness:(CGFloat)lineThickness
              radius:(CGFloat)lineRadius
               color:(UIColor *)lineColor
        initialState:(DoubleSegmentState)initState {
    self = [super init];
    if (self) {
        self.totalLength = length;
        self.lineThickness = lineThickness;
        self.lineColor = lineColor;
        self.lineRadius = lineRadius;
        self.backgroundColor = [UIColor clearColor].CGColor;
        
        self.frame = CGRectMake(0,
                                0,
                                length,
                                length);
        [self setupLines];
        [self animateToState:initState];
    }
    return self;
}

- (void) setupLines {
    self.topAnchorPoint = ((self.totalLength/2) / ((self.totalLength + self.lineThickness) / 2));
    self.topLine = [CAShapeLayer layer];
    self.topLine.bounds = CGRectMake(0,
                                     0,
                                     self.lineThickness,
                                     (self.totalLength + self.lineThickness)/2);
    self.topLine.path = [UIBezierPath bezierPathWithRoundedRect:self.topLine.bounds
                                                   cornerRadius:self.lineRadius].CGPath;
    self.topLine.fillColor = self.lineColor.CGColor;
    self.topLine.anchorPoint = CGPointMake(0.5, self.topAnchorPoint);
    self.topLine.position = CGPointMake(self.totalLength/2,
                                        self.totalLength/2);
    [self addSublayer:self.topLine];
    
    self.bottomLine = [CAShapeLayer layer];
    self.bottomLine.bounds = CGRectMake(0,
                                        0,
                                        self.lineThickness,
                                        (self.totalLength + self.lineThickness)/2);
    self.bottomLine.path = [UIBezierPath bezierPathWithRoundedRect:self.bottomLine.bounds
                                                      cornerRadius:self.lineRadius].CGPath;
    self.bottomLine.fillColor = self.lineColor.CGColor;
    self.bottomLine.anchorPoint = CGPointMake(0.5, 1-self.topAnchorPoint);
    self.bottomLine.position = CGPointMake(self.totalLength/2,
                                           self.totalLength/2);
    [self addSublayer:self.bottomLine];
}

- (void)setLineColor:(UIColor *)lineColor {
    if (_topLine) {
        _topLine.fillColor = lineColor.CGColor;
    }
    if (_bottomLine) {
        _bottomLine.fillColor = lineColor.CGColor;
    }
    _lineColor = lineColor;
}

- (void)setLineThickness:(CGFloat)lineThickness {
    self.topAnchorPoint = ((self.totalLength/2) / ((self.totalLength + lineThickness) / 2));
    if (_bottomLine) {
        _bottomLine.bounds = CGRectMake(0,
                                        0,
                                        lineThickness,
                                        (self.totalLength + lineThickness)/2);
        _bottomLine.path = [UIBezierPath bezierPathWithRoundedRect:self.bottomLine.bounds
                                                      cornerRadius:self.lineRadius].CGPath;
        self.bottomLine.anchorPoint = CGPointMake(0.5, 1-self.topAnchorPoint);
    }
    if (_topLine) {
        _topLine.bounds = CGRectMake(0,
                                     0,
                                     lineThickness,
                                     (self.totalLength + lineThickness)/2);
        _topLine.path = [UIBezierPath bezierPathWithRoundedRect:self.topLine.bounds
                                                   cornerRadius:self.lineRadius].CGPath;
        self.topLine.anchorPoint = CGPointMake(0.5, self.topAnchorPoint);
    }
    _lineThickness = lineThickness;
}

- (void)setLineRadius:(CGFloat)lineRadius
{
    if (_bottomLine) {
        _bottomLine.path = [UIBezierPath bezierPathWithRoundedRect:self.bottomLine.bounds
                                                      cornerRadius:lineRadius].CGPath;
    }
    if (_topLine) {
        _topLine.path = [UIBezierPath bezierPathWithRoundedRect:self.topLine.bounds
                                                   cornerRadius:lineRadius].CGPath;
    }
    _lineRadius = lineRadius;
}

- (void) animateToState:(DoubleSegmentState)finalState {
    float toValueTop = 0.0;
    float toValueBottom = 0.0;
    
    switch (finalState) {
        case doubleSegmentDefaultState:
            //Vertical lines
            toValueTop = 0.0;
            toValueBottom = 0.0;
            break;
        case doubleSegmentFirstQuadrantState:
            toValueTop = 0.0;
            toValueBottom = -M_PI_2;
            break;
        case doubleSegmentSecondQuadrantState:
            toValueTop = 0.0;
            toValueBottom = M_PI_2;
            break;
        case doubleSegmentThridQuadrantState:
            toValueTop = -M_PI_2;
            toValueBottom = 0.0;
            break;
        case doubleSegmentFourthQuadrantState:
            toValueTop = M_PI_2;
            toValueBottom = 0.0;
            break;
        case doubleSegmentLessThanState:
            toValueTop = M_PI_4;
            toValueBottom = -M_PI_4;
            break;
        case doubleSegmentMoreThanState:
            toValueTop = -M_PI_4;
            toValueBottom = M_PI_4;
            break;
        case doubleSegmentMinusState:
            toValueTop = -M_PI_2;
            toValueBottom = -M_PI_2;
            break;
        case doubleSegmentDownArrow:
            toValueTop = -M_PI_4;
            toValueBottom = -M_PI_4 * 3;
            break;
        case doubleSegmentUpArrow:
            toValueTop = -M_PI_4 * 3;
            toValueBottom = -M_PI_4;
            break;
        default:
            break;
    }
    
    [self addSpringRotationToLayer:self.topLine toValue:toValueTop];
    [self addSpringRotationToLayer:self.bottomLine toValue:toValueBottom];
}

- (void)animatePositionToPoint:(CGPoint)finalPosition {
    NSValue *toPoint = [NSValue valueWithCGPoint:finalPosition];
    [self addSpringTranslationToLayer:self.topLine toValue:toPoint];
    [self addSpringTranslationToLayer:self.bottomLine toValue:toPoint];
}


#pragma mark -
#pragma mark Helpers
- (void) addSpringRotationToLayer:(CAShapeLayer *)layer toValue:(CGFloat)toValue {
    
    POPSpringAnimation *anim = [layer pop_animationForKey:@"springRotation"];
    if (anim) {
        /* update to value to new destination */
        anim.toValue = @(toValue);
    } else {
        /* create and start a new animation */
        anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        anim.delegate = self;
        anim.springSpeed = 20;
        anim.springBounciness = 12;
        anim.dynamicsTension = 500;
        
        anim.toValue = @(toValue);
        anim.name = @"rotationToState";
        [layer pop_addAnimation:anim forKey:@"springRotation"];
    }
}

- (void) addSpringTranslationToLayer:(CAShapeLayer *)layer toValue:(NSValue *)toValue {
    POPSpringAnimation *anim = [layer pop_animationForKey:@"basicTranslation"];
    if (anim) {
        anim.toValue = toValue;
    } else {
        anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        anim.toValue = toValue;
        [layer pop_addAnimation:anim forKey:@"basicTranslation"];
    }
}

@end
