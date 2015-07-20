//
//  WeatherView.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/15.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView

@property (nonatomic, strong) UIImageView *weatherEventPicture;  //天气图片
@property (nonatomic, strong) UILabel *weatherTemperatureLabel;  //天气温度
@property (nonatomic, strong) UILabel *currtentAdress; //地址


@end
