//
//  PopMenuViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/19.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "PopMenuViewController.h"
#import "POPMenu.h"
#import "MenuItem.h"

@interface PopMenuViewController ()
@property (nonatomic, strong) UIButton * TapButton;

@property (nonatomic, strong) POPMenu *popMenu;

@end

@implementation PopMenuViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.TapButton];
    NotificationAddObserver(POPMenuHidButtonNotifaction, @selector(nihao));
    
}

- (void)nihao
{
     self.navigationController.navigationBar.hidden = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.TapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
}

- (void)tapAction:(UIButton*)sender
{
    NSLog(@"可以点击");
    [self showMenu];
    
}

- (void)showMenu {
    
//    [self.navigationItem setHidesBackButton:YES];
     self.navigationController.navigationBar.hidden = YES;
    
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    MenuItem *menuItem = [MenuItem itemWithTitle:@"Flickr" iconName:@"iconfont-cuban2luyin" glowColor:[UIColor whiteColor]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Googleplus" iconName:@"iconfont-zhaoxiangji" glowColor:[UIColor whiteColor]];
    [items addObject:menuItem];
    
    menuItem = [MenuItem itemWithTitle:@"Instagram" iconName:@"iconfont-huabei" glowColor:[UIColor whiteColor]];
    [items addObject:menuItem];

    
    if (!_popMenu) {
        _popMenu = [[POPMenu alloc] initWithFrame:self.view.bounds items:items];
        _popMenu.menuAnimationType = kPopMenuAnimationTypeSina;
    }
    if (_popMenu.isShowed) {
        return;
    }
    
    __weak PopMenuViewController *POP = self;
    _popMenu.didSelectedItemCompletion = ^(MenuItem *selectedItem) {
        POP.navigationController.navigationBar.hidden = NO;
    };
    
    [_popMenu showMenuAtView:self.view];
    
//    
//        [_popMenu showMenuAtView:self.view startPoint:CGPointMake(CGRectGetWidth(self.view.bounds) - 60, CGRectGetHeight(self.view.bounds)) endPoint:CGPointMake(60, CGRectGetHeight(self.view.bounds))];
}


- (UIButton*)TapButton
{
    if (_TapButton == nil) {
        _TapButton = [[UIButton alloc] init];
        _TapButton.backgroundColor = [UIColor redColor];
        [_TapButton setTitle:@"Tab In" forState:UIControlStateNormal];
        [_TapButton addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _TapButton;
}

@end
