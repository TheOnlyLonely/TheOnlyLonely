
//     ____    _                        __     _      _____
//    / ___\  /_\     /\/\    /\ /\    /__\   /_\     \_   \
//    \ \    //_\\   /    \  / / \ \  / \//  //_\\     / /\/
//  /\_\ \  /  _  \ / /\/\ \ \ \_/ / / _  \ /  _  \ /\/ /_
//  \____/  \_/ \_/ \/    \/  \___/  \/ \_/ \_/ \_/ \____/
//
//	            Copyright The Only Love by YangYi


#import "BaseViewController.h"
#import "RESideMenu.h"
#import "UIColor+FlatColors.h"
#import "VBFPopFlatButton.h"


@interface BaseViewController ()
@property (nonatomic, strong) VBFPopFlatButton *flatPlainButton;


- (void)transSetNavBackGround;
- (void)configureTitleView;
- (void)transSetNavLeftButton;

@end



@implementation BaseViewController

# pragma mark - View Lifecycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.listArray = [[NSMutableArray alloc] init];
        self.OnlyOneInfoArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self transsetnavBAckDafault];
}

# pragma mark - private methods

- (void)transSetNavLeftButton
{
    self.flatPlainButton = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(0, 0, 22, 20)
                                                       buttonType:buttonMenuType
                                                      buttonStyle:buttonPlainStyle];
    self.flatPlainButton.lineThickness = 2;
    self.flatPlainButton.tintColor = [UIColor blackColor];
    [self.flatPlainButton addTarget:self
                             action:@selector(presentLeftMenuViewController:)
                   forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.flatPlainButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
}

- (void)transsetnavBAckDafault
{
    // Custom initialization
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(-10, 0.0, 16, 16);
    [backButton setImage:[UIImage imageNamed:@"iconfont-fanhui"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStylePlain;
    self.navigationItem.leftBarButtonItem=temporaryBarButtonItem;
}

- (void)backAction:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)transSetNavBackGround
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)configureTitleView
{
    
    UILabel *headlinelabel = [[UILabel alloc] init];
    headlinelabel.font = [UIFont fontWithName:@"Avenir-Light" size:20];
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.textColor = [UIColor customGrayColor];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.title];
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor customBlueColor]
                             range:NSMakeRange(0, 1)];
    
    
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor customBlueColor]
                             range:NSMakeRange(3, 1)];
    
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor customBlueColor]
                             range:NSMakeRange(7, 1)];
    
    
    headlinelabel.attributedText = attributedString;
    [headlinelabel sizeToFit];
    
    [self.navigationItem setTitleView:headlinelabel];
}


#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AbstractMethod;
    return nil;
}

# pragma mark - Overridden getters

- (UITableView*)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
    }
    
    return _tableView;
}

@end
