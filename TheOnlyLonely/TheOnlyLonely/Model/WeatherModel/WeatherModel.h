//
//  WeatherModel.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/15.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "BaseModel.h"

@interface WeatherModel : BaseModel

@property (nonatomic, copy) NSString *temp;
@property (nonatomic, copy) NSString *temp_min;
@property (nonatomic, copy) NSString *temp_max;



@end
