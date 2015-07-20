//
//  AnimationViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/17.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "AnimationViewController.h"
#import "POPViewController.h"

@interface AnimationViewController ()
@property (nonatomic, strong) UILabel * label;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listArray = [@[@"Pop"]mutableCopy];
    [self.view addSubview:self.tableView];
    
    
    UIView * testView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 50, 50)];
    [testView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:testView];
    
    // Basic animations can be used to interpolate values over a specified time period. To use an ease-in ease-out animation to animate a view's alpha from 0.0 to 1.0 over the default duration:
    POPBasicAnimation *anBasic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anBasic.toValue = @(300);
    anBasic.beginTime = CACurrentMediaTime() + 1.0f;
    anBasic.duration = 4.0f;
    [testView pop_addAnimation:anBasic forKey:@"position"];
    
   // 弹簧
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    anSpring.toValue = @(100);
    anSpring.beginTime = CACurrentMediaTime() + 1.0f;
    anSpring.springBounciness = 10.0f;

    anSpring.springBounciness = 20.0;    //[0-20] 弹力 越大则震动幅度越大
    anSpring.springSpeed      = 20.0;   //[0-20] 速度 越大则动画结束越快
//    anSpring.dynamicsTension  = 0;      //拉力  接下来这三个都跟物理力学模拟相关 数值调整起来也很费时 没事不建议使用哈
//    anSpring.dynamicsFriction = 0;   //摩擦 同上
//    anSpring.dynamicsMass     = 0;     //质量 同上
    [testView pop_addAnimation:anSpring forKey:@"position"];
    
    
//    POPDecayAnimation *anDecay = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    anDecay.velocity = @(300);
//    anDecay.deceleration = 0.998;  //衰减系数(越小则衰减得越快)
//
//    anDecay.beginTime = CACurrentMediaTime() + 1.0f;
//    [testView pop_addAnimation:anDecay forKey:@"position"];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.label];
//    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"countdown" initializer:^(POPMutableAnimatableProperty *prop) {
//        
//        prop.writeBlock = ^(id obj, const CGFloat values[]) {
//            self.label = (UILabel*)obj;
//            self.label.text  = [NSString stringWithFormat:@"%02d:%02d:%02d",(int)values[0]/60,(int)values[0]%60,(int)(values[0]*100)%100];
//        };
//        
//                prop.threshold = 20.01f;
//    }];
//    
//    POPBasicAnimation *anBasic = [POPBasicAnimation linearAnimation];   //秒表当然必须是线性的时间函数
//    anBasic.property = prop;    //自定义属性
//    anBasic.fromValue = @(0);   //从0开始
//    anBasic.toValue = @(3*60);  //180秒
//    anBasic.duration = 3*60;    //持续3分钟
//    anBasic.beginTime = CACurrentMediaTime() + 1.0f;    //延迟1秒开始
//    [self.label pop_addAnimation:anBasic forKey:@"countdown"];
//    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    self.tableView.frame = CGRectMake(0, 159, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.listArray[indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
    POPViewController * pop = [[POPViewController alloc] init];
    [self.navigationController pushViewController:pop animated:YES];
        
    }
    
}
@end
