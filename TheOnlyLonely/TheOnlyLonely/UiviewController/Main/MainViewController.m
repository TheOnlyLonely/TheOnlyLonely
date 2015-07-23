//
//  MainViewController.mma
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/14.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "MainViewController.h"
#import "WeatherView.h"
#import <AMapNaviKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import <AMapNaviKit/MAMapKit.h>
#import "WeatherModel.h"
#import "MainCell.h"
#import "POPViewController.h"
#import "LonelyManager.h"
#import "WeatherModel.h"

static CGFloat const kFadeInDuration = 1.5;

@interface MainViewController ()

@property (nonatomic, strong) MAMapView *mapView;

//当前时间
@property (nonatomic, copy) NSString * currtentTime;
@property (nonatomic, copy) NSString *currtentAdress;

//视图UI
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageView;
@property (nonatomic, strong) WeatherView *weatherView;
@property (nonatomic, assign) CGFloat screenHeight;


@end

@implementation MainViewController


# pragma mark - View Lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //------------从上到下
    self.title = NSLocalizedString(@"TheOnlyLonely", nil);
    [self configureTitleView];
    [self transSetNavLeftButton];
    [self transSetNavBackGround];
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.blurredImageView];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.weatherView;
    
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    //设置为模糊视图
    [self.blurredImageView setImageToBlur:self.backgroundImageView.image blurRadius:10 completionBlock:nil];
    
    //设置数据源
     self.listArray = [@[
       @{@"text": @"Animation", @"icon": @"iconfont-shuaxindongxiao"},
       @{@"text": @"Video", @"icon": @"iconfont-ordinaryvideo"},
       @{@"text": @"Music", @"icon": @"iconfont-yinlesongchi"},
       @{@"text": @"Settings", @"icon": @""},
       @{@"text": @"Log Out", @"icon": @""}
       ]mutableCopy];
    
    //RAC
    [[RACObserve([LonelyManager sharedManager], condition)
      deliverOn:RACScheduler.mainThreadScheduler]
     subscribeNext:^(WeatherModel * model) {
         if (model) {
            self.weatherView.temperatureLabel.text = [NSString stringWithFormat:@"%.0f°", ([model.temp floatValue]-32)/1.8];
             self.weatherView.hiloLabel.text = [NSString stringWithFormat:@"%.0fC°/%.0fC°",([model.temp_min floatValue]-32)/1.8, ([model.temp_max floatValue]-32)/1.8];
            [self viewAlphaShow];
         }
     }];
    
    [[LonelyManager sharedManager] findCurrentLocation];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect bounds = self.view.bounds;
    self.backgroundImageView.frame = bounds;
    self.blurredImageView.frame = bounds;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view).with.insets = (UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

# pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    MainCell*cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[MainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary * dic = self.listArray[indexPath.row];
    [self configureMainCell:cell Dic:dic];
  
    return cell;
    
}

- (void)configureMainCell:(MainCell *)cell Dic:(NSDictionary *)dic
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    cell.textLabel.text = dic[@"text"];
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
}

# pragma mark - UITableVieDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        POPViewController *animation = [[POPViewController alloc] init];
        animation.transTitle = self.listArray[indexPath.row][@"text"];
        [self.navigationController pushViewController:animation animated:YES];
    }
}


- (void)viewAlphaShow
{
   [UIView animateWithDuration:kFadeInDuration animations:^{
       
       self.weatherView.temperatureLabel.alpha = 1.0f;
       self.weatherView.hiloLabel.alpha = 1.0f;
       
   }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat height = scrollView.bounds.size.height;
    CGFloat position = MAX(scrollView.contentOffset.y, 0.0);
    CGFloat percent = MIN(position / height, 1.0);
    self.blurredImageView.alpha = percent;
    
}



# pragma mark - Overridden getters

- (UIImageView*)backgroundImageView
{
    if (_backgroundImageView == nil) {
        UIImage *background = [UIImage imageNamed:@"MainBackicon"];
        _backgroundImageView = [[UIImageView alloc] initWithImage:background];
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundImageView;
}

- (UIImageView*)blurredImageView
{
    if (_blurredImageView == nil) {
         _blurredImageView = [[UIImageView alloc] init];
        _blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
        _blurredImageView.alpha = 0;
    }
    
    return _blurredImageView;
}

- (WeatherView*)weatherView
{
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    
    if (_weatherView == nil) {
        _weatherView = [[WeatherView alloc] init];
        _weatherView.frame = headerFrame;
        _weatherView.backgroundColor = [UIColor clearColor];
      
    }
    
    return _weatherView;
}

@end
