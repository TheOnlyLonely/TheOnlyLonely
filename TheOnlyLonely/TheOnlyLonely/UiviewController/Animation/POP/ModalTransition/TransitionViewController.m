//
//  TransitionViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/21.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    self.view.backgroundColor = [UIColor customBlueColor];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
