//
//  ShareAccount.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareAccount.h"
#import "ShareAccountTableViewCell.h"
#import "ShareAccountTableViewCell2.h"
#import "AccountSetup/AccountSetupViewController.h"
#import "AccountMessage/AccountMessageViewController.h"
#import "AccountGood/AccountGoodViewController.h"

@interface ShareAccount ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *shareAccountTableView;

@end

@implementation ShareAccount
- (void)viewDidDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else {
        return 6;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    else {
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 0;
    }
    else {
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 130;
    } else {
        return 50;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.95f alpha:1.00f];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.95f alpha:1.00f];
    return view;
}

//选中 cell 时触发的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
        }
        else if (indexPath.row == 1){
            /*----------------跳下一界面时，不显示分栏控制器--------------------*/
            self.hidesBottomBarWhenPushed = YES ;
            
            AccountMessageViewController *accountMessageViewController = [[AccountMessageViewController alloc]init];
            [self.navigationController pushViewController:accountMessageViewController animated:YES];
            
        }
        else if (indexPath.row == 2) {
            
            self.hidesBottomBarWhenPushed = YES;
            
            AccountGoodViewController *accountGoodViewController = [[AccountGoodViewController alloc]init];
            [self.navigationController pushViewController:accountGoodViewController animated:YES];
            
        }
        else if (indexPath.row == 4){
            /*----------------跳下一界面时，不显示分栏控制器--------------------*/
            self.hidesBottomBarWhenPushed = YES ;
            
            AccountSetupViewController *accountSetupViewController = [[AccountSetupViewController alloc]init];
            //切换界面   NO：取消动画    不会卡页面
            [self.navigationController pushViewController:accountSetupViewController animated:YES] ;
        }
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ShareAccountTableViewCell *shareAccountTableViewCell = [[ShareAccountTableViewCell alloc]init];
        //除去点击的灰色效果
        shareAccountTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
        return shareAccountTableViewCell;
    }
    else{
        ShareAccountTableViewCell2 *shareAccountTableViewCell2 = [[ShareAccountTableViewCell2 alloc]init];
        NSArray *TextArray = [NSArray arrayWithObjects:@"我上传的", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
        shareAccountTableViewCell2.nameLabel.text = [TextArray objectAtIndex:indexPath.row];
        
        NSArray *ImageArray = [NSArray arrayWithObjects:@"img2.png", @"img4.png", @"button_zan.png", @"img5.png", @"img6.png", @"img7.png", nil];
        shareAccountTableViewCell2.leftImageView.image = [UIImage imageNamed:[ImageArray objectAtIndex:indexPath.row]];
        
        //除去点击的灰色效果
        shareAccountTableViewCell2.selectionStyle = UITableViewCellEditingStyleNone;
        return shareAccountTableViewCell2;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"个人信息" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    //改变导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO ;
    
    //左边按钮
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:nil] ;
    [leftBarButtonItem setTintColor:[UIColor whiteColor]] ;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem ;
    
    //隐藏导航栏底部分界线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImage"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
/*---------------------单元格-----------------------*/
    _shareAccountTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _shareAccountTableView.delegate = self;
    _shareAccountTableView.dataSource = self;
    [self.view addSubview:_shareAccountTableView];

    //去除下面多余的线
    _shareAccountTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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
