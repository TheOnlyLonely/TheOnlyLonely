//
//  LonelyManager.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/22.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AMapNaviKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import <AMapNaviKit/MAMapKit.h>
#import "WeatherModel.h"


@interface LonelyManager : NSObject
<
CLLocationManagerDelegate
>

+ (instancetype)sharedManager;

@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong, readonly) WeatherModel* condition;
@property (nonatomic, strong, readonly) NSArray *hourlyForecast;
@property (nonatomic, strong, readonly) NSArray *dailyForecast;


@property (nonatomic, copy, readwrite) NSString * str;

- (void)findCurrentLocation;


@end
