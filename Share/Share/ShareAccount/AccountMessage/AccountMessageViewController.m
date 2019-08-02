//
//  AccountMessageViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageViewController.h"
#import "AccountMessageTableViewCell.h"
#import "AccountMessageFan/AccountMessageFanViewController.h"
#import "AccountMessageChat/AccountMessageChatViewController.h"

@interface AccountMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *accountMessageTableView;

@end

@implementation AccountMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的信息" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
/*--------------------------单元格----------------------------*/
    _accountMessageTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountMessageTableView.delegate = self;
    _accountMessageTableView.dataSource = self;
    [self.view addSubview:_accountMessageTableView];
    
    _accountMessageTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*--------------------------单元格----------------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AccountMessageTableViewCell *accountMessageTableViewCell = [[AccountMessageTableViewCell alloc]init];
    
    NSMutableArray *nameArray = [NSMutableArray arrayWithObjects:@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知", nil];
    NSMutableArray *numbleArray = [NSMutableArray arrayWithObjects:@"7", @"9", @"5", @"4", @"1", nil];
    
    accountMessageTableViewCell.nameLabel.text = [nameArray objectAtIndex:indexPath.row];
    accountMessageTableViewCell.numbleLabel.text = [numbleArray objectAtIndex:indexPath.row];
    
    accountMessageTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return accountMessageTableViewCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        /*----------------跳下一界面时，不显示分栏控制器--------------------*/
        self.hidesBottomBarWhenPushed = YES ;
        AccountMessageFanViewController *accountMessageFanViewController = [[AccountMessageFanViewController alloc]init];
        [self.navigationController pushViewController:accountMessageFanViewController animated:YES];
    }
    else if (indexPath.row == 3){
        self.hidesBottomBarWhenPushed = YES;
        AccountMessageChatViewController *accountMessageChatViewController = [[AccountMessageChatViewController alloc]init];
        [self.navigationController pushViewController:accountMessageChatViewController animated:YES];
    }
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
