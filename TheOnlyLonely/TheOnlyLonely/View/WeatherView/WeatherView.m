//
//  WeatherView.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/15.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "WeatherView.h"

@implementation WeatherView

static NSString * const kHelveticaNeueFontName = @"HelveticaNeue-UltraLight";
static NSString * const kDefaultFontName = @"Avenir-Light";

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       [self InitUI];
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)InitUI{
    
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    CGFloat inset = 20;
    CGFloat temperatureHeight = 110;
    CGFloat hiloHeight = 60;
    CGFloat iconHeight = 30;
    CGRect hiloFrame = CGRectMake(inset, headerFrame.size.height - hiloHeight, headerFrame.size.width - 2*inset, hiloHeight);
    
    CGRect temperatureFrame = CGRectMake(inset, headerFrame.size.height - temperatureHeight - hiloHeight, headerFrame.size.width - 2*inset, temperatureHeight);
    CGRect iconFrame = CGRectMake(inset, temperatureFrame.origin.y - iconHeight, iconHeight, iconHeight);
    CGRect conditionsFrame = iconFrame;
    
    // make the conditions text a little smaller than the view
    // and to the right of our icon
    conditionsFrame.size.width = self.bounds.size.width - 2*inset - iconHeight - 10;
    conditionsFrame.origin.x = iconFrame.origin.x + iconHeight + 10;
    
    // bottom left
    self.temperatureLabel = [[UILabel alloc] initWithFrame:temperatureFrame];
    _temperatureLabel.backgroundColor = [UIColor clearColor];
    _temperatureLabel.textColor = [UIColor whiteColor];
    _temperatureLabel.alpha = 0.0f;
    _temperatureLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:120];
    [self addSubview:_temperatureLabel];
    
    // bottom left
    self.hiloLabel = [[UILabel alloc] initWithFrame:hiloFrame];
    _hiloLabel.backgroundColor = [UIColor clearColor];
    _hiloLabel.textColor = [UIColor whiteColor];
    _hiloLabel.text = @"0° / 0°";
    _hiloLabel.alpha = 0.0f;
    _hiloLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
    [self addSubview:_hiloLabel];
    
}

@end
