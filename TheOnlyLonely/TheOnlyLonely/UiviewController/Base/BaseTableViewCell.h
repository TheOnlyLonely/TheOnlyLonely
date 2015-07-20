//
//  BaseTableViewCell.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/18.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

- (void)InitCell;
- (void)custiomUI;
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;
@end
