//
//  MenuButton.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/19.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItem;

typedef void(^DidSelctedItemCompletedBlock)(MenuItem *menuItem);

@interface MenuButton : UIView

/**
 *  点击操作
 */
@property (nonatomic, copy) DidSelctedItemCompletedBlock didSelctedItemCompleted;

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame menuItem:(MenuItem *)menuItem;


@end
