//
//  WeatherModel.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/15.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "BaseModel.h"

@interface WeatherModel : BaseModel

@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *weather_pic;
@property (nonatomic, copy) NSString *wind_direction;
@property (nonatomic, copy) NSString *wind_power;


@end
