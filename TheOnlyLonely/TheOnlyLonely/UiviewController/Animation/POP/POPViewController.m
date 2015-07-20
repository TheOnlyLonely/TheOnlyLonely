//
//  POPViewController.m
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/18.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

#import "POPViewController.h"
#import "ShakeViewController.h"
#import "PopMenuViewController.h"

@interface POPViewController ()

@end

@implementation POPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listArray = [@[@"ShakeButton", @"POPMenu"]mutableCopy];
    
    [self.view addSubview:self.tableView];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:21];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
    
    cell.textLabel.text = self.listArray[indexPath.row];
    
    
    return cell;
    
}

# pragma mark - UITableVieDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
    ShakeViewController * shake = [[ShakeViewController alloc] init];
    [self.navigationController pushViewController:shake animated:YES];
    }else if (indexPath.row == 1){
        PopMenuViewController *menu = [[PopMenuViewController alloc] init];
        [self.navigationController pushViewController:menu animated:YES];
    }
    
}



@end
