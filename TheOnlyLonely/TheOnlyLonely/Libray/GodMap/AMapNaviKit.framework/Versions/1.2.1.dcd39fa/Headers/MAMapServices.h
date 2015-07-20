//
//  MAMapServices.h
//  MapKit_static
//
//  Created by songjian on 13-6-13.
//  Copyright (c) 2013年 songjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAMapServices : NSObject

+ (MAMapServices *)sharedServices;

/*!
 @brief API Key, 在创建MAMapView之前需要先绑定key.
 */
@property (nonatomic, copy) NSString *apiKey;

/*!
 @brief SDK 版本号.
 */
@property (nonatomic, readonly) NSString *SDKVersion;

@end
