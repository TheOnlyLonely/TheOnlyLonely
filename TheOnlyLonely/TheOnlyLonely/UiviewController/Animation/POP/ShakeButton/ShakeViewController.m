//
//  ShakeViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/18.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "ShakeViewController.h"
#import "ShakeButton.h"

@interface ShakeViewController ()

@property (nonatomic, strong) ShakeButton *shakeButton;
@property (nonatomic, strong) UILabel *errorLablel;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation ShakeViewController

# pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.shakeButton];
    [self.view insertSubview:self.errorLablel belowSubview:self.shakeButton];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.activityIndicatorView];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.shakeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(260, 50));
    }];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLablel
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self.shakeButton
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1
                              constant:0.f]];
    
    [self.view addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.errorLablel
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual toItem:self.shakeButton
                              attribute:NSLayoutAttributeCenterY
                              multiplier:1
                              constant:0]];
}


# pragma mark - EventResponse

- (void)touchUpInside:(ShakeButton*)sender
{
    [self hideLabel];
    [self.activityIndicatorView startAnimating];
     sender.userInteractionEnabled = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.activityIndicatorView stopAnimating];
        [self shakeAnimation];
        [self showLabel];
    });
}

- (void)shakeAnimation
{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        self.shakeButton.userInteractionEnabled = YES;
    }];
    [self.shakeButton.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

# pragma mark - Show & hide

- (void)showLabel
{
    self.errorLablel.layer.opacity = 1.0;
    POPSpringAnimation *layerScaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.springBounciness = 18;
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1.f, 1.f)];
    [self.errorLablel.layer pop_addAnimation:layerScaleAnimation forKey:@"labelScaleAnimation"];
    
    POPSpringAnimation *layerPositionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.shakeButton.layer.position.y + self.shakeButton.intrinsicContentSize.height);
    layerPositionAnimation.springBounciness = 12;
    [self.errorLablel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}

- (void)hideLabel
{
    POPBasicAnimation *layerScaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    layerScaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.5f, 0.5f)];
    [self.errorLablel.layer pop_addAnimation:layerScaleAnimation forKey:@"layerScaleAnimation"];
    
    POPBasicAnimation *layerPositionAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    layerPositionAnimation.toValue = @(self.shakeButton.layer.position.y);
    [self.errorLablel.layer pop_addAnimation:layerPositionAnimation forKey:@"layerPositionAnimation"];
}


# pragma mark - Overridden getters

- (UIActivityIndicatorView*)activityIndicatorView
{
    if (_activityIndicatorView == nil) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    return _activityIndicatorView;
}
- (ShakeButton*)shakeButton
{
    if (_shakeButton == nil) {
        _shakeButton = [ShakeButton InitButton];
        _shakeButton.backgroundColor = [UIColor customBlueColor];
        _shakeButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_shakeButton setTitle:@"Log in" forState:UIControlStateNormal];
        [_shakeButton addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shakeButton;
}

- (UILabel*)errorLablel
{
    if (_errorLablel == nil) {
        _errorLablel = [[UILabel alloc] init];
        _errorLablel.font = [UIFont fontWithName:@"Avenir-Light" size:18];
        _errorLablel.textColor = [UIColor customRedColor];
        _errorLablel.translatesAutoresizingMaskIntoConstraints = NO;
        _errorLablel.text = @"The only login error.";
        _errorLablel.textAlignment = NSTextAlignmentCenter;
        _errorLablel.layer.transform = CATransform3DMakeScale(0.5f, 0.5f, 1.f);
        
    }
    return _errorLablel;
}





@end
