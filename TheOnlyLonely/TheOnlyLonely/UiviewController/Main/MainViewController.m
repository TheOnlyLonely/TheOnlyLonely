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
#import "AnimationViewController.h"
#import "MainCell.h"
#import "POPViewController.h"

static CGFloat const kFadeInDuration = 2.0;

@interface MainViewController ()
<
    MAMapViewDelegate,
    AMapSearchDelegate
>
{
    AMapSearchAPI *_search;
}

@property (nonatomic, strong) WeatherView *weatherView;
@property (nonatomic, strong) MAMapView *mapView;

//经纬度
@property (nonatomic, assign) float currtentLatitude;
@property (nonatomic, assign) float currtentLongitude;

//当前时间
@property (nonatomic, copy) NSString * currtentTime;
@property (nonatomic, copy) NSString *currtentAdress;

@end

@implementation MainViewController

# pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"TheOnlyLonely", nil);
    [self configureTitleView];
    
  self.listArray =  [@[
       @{@"text": @"Music", @"icon": @"iconfont-yinlesongchi"},
       @{@"text": @"Video", @"icon": @"iconfont-ordinaryvideo"},
       @{@"text": @"Animation", @"icon": @"iconfont-shuaxindongxiao"},
       @{@"text": @"Settings", @"icon": @""},
       @{@"text": @"Log Out", @"icon": @""}
       ]mutableCopy];

    [self transSetNavLeftButton];
    [self.view addSubview:self.tableView];
    self.weatherView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    self.tableView.tableHeaderView = self.weatherView;
    
    self.mapView.showsUserLocation = YES;
    _search = [[AMapSearchAPI alloc] initWithSearchKey:@"c87a0031ce8fc435c3eda104135ccd46" Delegate:self];
    
    NSDate * date = [NSDate date];
    self.currtentTime = [NSDate stringFromDate:date format:@"yyyyMMddHHmmss"];

    self.tableView.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
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
    cell.textLabel.text = dic[@"text"];
    cell.imageView.image = [UIImage imageNamed:dic[@"icon"]];
    
    
    return cell;
    
}

# pragma mark - UITableVieDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        
        POPViewController *animation = [[POPViewController alloc] init];
        [self.navigationController pushViewController:animation animated:YES];
    }
}



# pragma mark - MapViewDelegate

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        self.currtentLatitude = userLocation.coordinate.latitude;
        self.currtentLongitude = userLocation.coordinate.longitude;
        
        AMapReGeocodeSearchRequest *regeoRequest= [[AMapReGeocodeSearchRequest alloc] init];
        regeoRequest.searchType = AMapSearchType_ReGeocode;
        regeoRequest.location = [AMapGeoPoint locationWithLatitude:self.currtentLatitude longitude:self.currtentLongitude];
        regeoRequest.radius = 1000;
        regeoRequest.requireExtension = YES;
        
         [_search AMapReGoecodeSearch:regeoRequest];
        
    NSString * urlstr = [NSString stringWithFormat:@"http://route.showapi.com/9-5?showapi_sign=%@&showapi_appid=%@&showapi_timestamp=%@&from=5&lat=%f&lng=%f", secret, appid, self.currtentTime,self.currtentLatitude, self.currtentLongitude];
        
    AFHTTPRequestOperationManager *manager =[AFHTTPRequestOperationManager manager];
    [manager GET:urlstr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = responseObject[@"showapi_res_body"];
        NSDictionary *nowDIc = dic[@"now"];
        WeatherModel *model = [[WeatherModel alloc] init];
        [model setValuesForKeysWithDictionary:nowDIc];
      
        self.weatherView.weatherTemperatureLabel.text = [NSString stringWithFormat:@"%@℃", model.temperature];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%@", error);
    }];
        
    }
    
}

#pragma mark - AMapSearchDelegate

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    //实现逆地理编码的回调函数
    if(response.regeocode != nil)
    {
        //得到城市
        if (response.regeocode.formattedAddress&&![response.regeocode.formattedAddress isEqualToString:@""]){
            self.weatherView.currtentAdress.text = response.regeocode.formattedAddress;
            [self fadeIn];
        }
      
        _mapView.showsUserLocation = NO;
    }
}

- (void)fadeIn {
    // fade in the components
    [UIView animateWithDuration:kFadeInDuration animations:^{
        self.weatherView.weatherTemperatureLabel.alpha = 1.0;
        self.weatherView.currtentAdress.alpha = 1.0;
   
    }];
}


# pragma mark - Overridden getters

- (WeatherView*)weatherView
{
    if (_weatherView == nil) {
        _weatherView = [[WeatherView alloc] init];
      
    }
    
    return _weatherView;
}

- (MAMapView*)mapView
{
    if (_mapView == nil) {
        _mapView = [[MAMapView alloc]init];
        _mapView.delegate = self;
        
        //地图定位权限
        BOOL rs=[CLLocationManager locationServicesEnabled];
        //是否具有定位权限
        int status=[CLLocationManager authorizationStatus];
        
        if(!rs || status<3){
            //请求权限
            DLog(@"没有定位权限...");
        }
    }
    
    return _mapView;
}

@end
