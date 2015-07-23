//
//  CustomViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/21.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "CustomViewController.h"
#import "TransitionViewController.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

@interface CustomViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *presentButton;

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self.view addSubview:self.presentButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.presentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 50));
    }];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [[PresentingAnimator alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimator alloc] init];
}


- (void)present:(id)sender
{
    TransitionViewController*modalViewController = [[TransitionViewController alloc] init];
    modalViewController.transitioningDelegate = self;
    modalViewController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:modalViewController animated:YES completion:NULL];
}

- (UIButton*)presentButton
{
    if (_presentButton == nil) {
        _presentButton = [[UIButton alloc] init];
        _presentButton.backgroundColor = [UIColor customBlueColor];
        [_presentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _presentButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_presentButton setTitle:@"Present Modal View Controller" forState:UIControlStateNormal];
        [_presentButton addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_presentButton];
    }
    
    return _presentButton;
}



@end
