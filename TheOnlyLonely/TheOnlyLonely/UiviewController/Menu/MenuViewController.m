//
//  MenuViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/13.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.listArray = [@[@"Home", @"Calendar", @"Profile", @"Settings", @"Log Out"]mutableCopy];
    
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
     self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 130;
    self.tableView.frame = rect;
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:21];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.highlightedTextColor = [UIColor whiteColor];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.textLabel.text = self.listArray[indexPath.row];
    
    return cell;
    
}


@end
