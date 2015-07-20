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
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Weather_back"]];
    imageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self addSubview:imageView];
    
    self.weatherTemperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH, 65)];
    _weatherTemperatureLabel.textColor = [UIColor blackColor];
    _weatherTemperatureLabel.font = [UIFont fontWithName:kHelveticaNeueFontName size:35];
    _weatherTemperatureLabel.textAlignment = NSTextAlignmentLeft;
    _weatherTemperatureLabel.alpha = 0;
    [imageView addSubview:self.weatherTemperatureLabel];
    
    self.currtentAdress = [[UILabel alloc] initWithFrame:CGRectMake(10, 200-25, SCREEN_WIDTH, 15)];
    self.currtentAdress.textColor = [UIColor blackColor];
    self.currtentAdress.alpha = 0;
     self.currtentAdress.font = [UIFont fontWithName:kDefaultFontName size:15];
    
    [imageView addSubview:self.currtentAdress];
    
}


@end
