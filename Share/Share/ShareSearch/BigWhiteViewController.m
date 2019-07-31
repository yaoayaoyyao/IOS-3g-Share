//
//  BigWhiteViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "BigWhiteViewController.h"
#import "BigWhiteTableViewCell.h"

@interface BigWhiteViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property UITableView *bigWhiteTableView;
@property UITextField *bigWhiteTextField;
@property BigWhiteTableViewCell *bigWhiteTableViewCell;

@end

@implementation BigWhiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
/*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"搜索" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    //改变导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO ;
    
    //左边按钮
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)] ;
    [leftBarButtonItem setTintColor:[UIColor whiteColor]] ;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem ;
    
    //右边按钮
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"radio_button_note.png"] style:UIBarButtonItemStyleDone target:self action:@selector(upload)];
    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //隐藏导航栏底部分界线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImage"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
/*------------------搜索栏------------------*/
    _bigWhiteTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 355, 50)];
    _bigWhiteTextField.borderStyle = UITextBorderStyleRoundedRect;
    _bigWhiteTextField.keyboardType = UIKeyboardTypeDefault;
    _bigWhiteTextField.delegate = self;
    _bigWhiteTextField.returnKeyType = UIReturnKeySearch;
    
    //左边搜索图标总是显示
    _bigWhiteTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"radio_button_search.png"]];
    //左边搜索图标的模式
    leftImageView.contentMode = UIViewContentModeCenter;
    _bigWhiteTextField.leftView = leftImageView;
    
    _bigWhiteTextField.text = @"大白";
    
    [self.view addSubview:_bigWhiteTextField];
    
/*------------------单元格------------------*/
    _bigWhiteTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _bigWhiteTableView.delegate = self;
    _bigWhiteTableView.dataSource = self;
    UIView *bigWhiteView = [[UIView alloc]init];
    bigWhiteView.frame = CGRectMake(0, 0, 375, 50);
    [bigWhiteView addSubview:_bigWhiteTextField];
    _bigWhiteTableView.tableHeaderView = bigWhiteView;
    [self.view addSubview:_bigWhiteTableView];
    
}

/*-------------------------------搜索栏------------------------------*/
- (void)pressLeft{
    //切换界面   NO：取消动画    不会卡页面
    [self.navigationController popViewControllerAnimated:NO] ;
}
//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_bigWhiteTextField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if ([textField.text isEqualToString:@""]) {
        [self.navigationController popViewControllerAnimated:NO] ;
    }
    return  YES;
}

/*-------------------------------单元格------------------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 25;
    }
    else{
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _bigWhiteTableViewCell = [[BigWhiteTableViewCell alloc]init];
    NSArray *LeftImageArray = [NSArray arrayWithObjects:@"bigwhite_img1.png", @"bigwhite_img2.png", nil];
    NSArray *ThemeLabelArray = [NSArray arrayWithObjects:@"Icon of Baymax", @"每个人都需要一个大白", nil];
    NSArray *NameLabelArray = [NSArray arrayWithObjects:@"share小白", @"share小王", nil];
    NSArray *TypeLabelArray = [NSArray arrayWithObjects:@"原创-UI-icon", @"原创作品-摄影", nil];
    NSArray *TimeLabelArray = [NSArray arrayWithObjects:@"15分钟前", @"1个月前", nil];
    
    
    _bigWhiteTableViewCell.LeftImageView.image = [UIImage imageNamed:[LeftImageArray objectAtIndex:indexPath.section]];
    _bigWhiteTableViewCell.ThemeLabel.text = [ThemeLabelArray objectAtIndex:indexPath.section];
    _bigWhiteTableViewCell.NameLabel.text = [NameLabelArray objectAtIndex:indexPath.section];
    _bigWhiteTableViewCell.TypeLabel.text = [TypeLabelArray objectAtIndex:indexPath.section];
    _bigWhiteTableViewCell.TimeLabel.text = [TimeLabelArray objectAtIndex:indexPath.section];
    
    return _bigWhiteTableViewCell;
}

/*---------------------导航栏右边按钮 上传-----------------------*/
- (void)upload{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
