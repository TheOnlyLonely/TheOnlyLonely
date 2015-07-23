//
//  WeatherClient.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/22.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface WeatherClient : NSObject

@property (nonatomic, strong) NSArray * currtentArray;

- (RACSignal *)fetchJSONFromURL:(NSURL *)url;
- (RACSignal *)fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate;


@end
