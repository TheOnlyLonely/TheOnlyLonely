//
//  BaseViewController.h
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/13.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
UINavigationControllerDelegate
>

//列表数据源
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) UITableView *tableView;

//不是数据源的数组
@property (nonatomic, strong) NSMutableArray *OnlyOneInfoArray;

@property (nonatomic, copy) NSString * transTitle;


# pragma mark - Over Nav

//返回
- (void)transSetNavLeftButton;
//设置导航栏背景
- (void)transSetNavBackGround;
//设置导航栏字体颜色
- (void)configureTitleView;
- (void)transsetnavBAckDafault;


@end
