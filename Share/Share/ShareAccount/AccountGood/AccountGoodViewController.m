//
//  AccountGoodViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountGoodViewController.h"
#import "ShareMainTableViewCell.h"

@interface AccountGoodViewController ()<UITableViewDelegate, UITableViewDataSource>

@property UITableView *accountGoodTableView;
@property ShareMainTableViewCell *accountGoodTableViewCell;

@end

@implementation AccountGoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我推荐的" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
    
/*--------------------------单元格----------------------------*/
    _accountGoodTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _accountGoodTableView.delegate = self;
    _accountGoodTableView.dataSource = self;
    [self.view addSubview:_accountGoodTableView];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*--------------------------单元格----------------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    else{
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 3) {
        return 10;
    }
    else{
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _accountGoodTableViewCell = [[ShareMainTableViewCell alloc]init];
    
    NSArray *LeftImageArray = [NSArray arrayWithObjects:@"list_img1.png", @"list_img2.png", nil];
    NSArray *TypeLabelArray = [NSArray arrayWithObjects:@"原创-插画-练习作品", @"平面设计-画册设计", nil];
    NSArray *TimeLabelArray = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", nil];
    NSArray *GoodButtonArray = [NSMutableArray arrayWithObjects:@"102", @"102", nil];
    NSArray *FanButtonArray = [NSArray arrayWithObjects:@"26", @"26", nil];
    NSArray *NameLabelArray = [NSArray arrayWithObjects:@"匆匆那年   share小白", @"字体故事   share小律", nil];
    
    _accountGoodTableViewCell.LeftImageView.image = [UIImage imageNamed:[LeftImageArray objectAtIndex:indexPath.section]];
    _accountGoodTableViewCell.NameLabel.text = [NameLabelArray objectAtIndex:indexPath.section];
    _accountGoodTableViewCell.TypeLabel.text = [TypeLabelArray objectAtIndex:indexPath.section];
    _accountGoodTableViewCell.TimeLabel.text = [TimeLabelArray objectAtIndex:indexPath.section];
    [_accountGoodTableViewCell.GoodButton setTitle:[GoodButtonArray objectAtIndex:indexPath.section] forState:UIControlStateNormal];
    [_accountGoodTableViewCell.FanButton setTitle:[FanButtonArray objectAtIndex:indexPath.section] forState:UIControlStateNormal];
    
    _accountGoodTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return _accountGoodTableViewCell;
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
