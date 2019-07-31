//
//  AccountSetupViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupViewController.h"
#import "ShareAccountTableViewCell2.h"
#import "AccountSetupMessage/AccountSetupMessageViewController.h"
#import "AccountSetupModify/AccountSetupModifyViewController.h"
#import "AccountSetupIntroduction/AccountSetupIntroductionViewController.h"

@interface AccountSetupViewController ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *accountSetupTableView;

@end

@implementation AccountSetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
    
/*--------------------------单元格----------------------------*/
    _accountSetupTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountSetupTableView.delegate = self;
    _accountSetupTableView.dataSource = self;
    [self.view addSubview:_accountSetupTableView];
    
    _accountSetupTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

/*--------------------------单元格----------------------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShareAccountTableViewCell2 *shareAccountTableViewCell2 = [[ShareAccountTableViewCell2 alloc]init];
    
    NSMutableArray *labelMutableArray = [NSMutableArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    
    shareAccountTableViewCell2.nameLabel.text = [labelMutableArray objectAtIndex:indexPath.row];
    
    shareAccountTableViewCell2.selectionStyle = UITableViewCellEditingStyleNone;
    
    return shareAccountTableViewCell2;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        AccountSetupIntroductionViewController  *accountSetupIntroductionViewController = [[AccountSetupIntroductionViewController alloc]init];
        //切换界面   NO：取消动画    不会卡页面
        [self.navigationController pushViewController:accountSetupIntroductionViewController animated:YES] ;
        
    } else if (indexPath.row == 1) {
        
        AccountSetupModifyViewController *accountSetupModifyViewController = [[AccountSetupModifyViewController alloc]init];
        //切换界面   NO：取消动画    不会卡页面
        [self.navigationController pushViewController:accountSetupModifyViewController animated:YES] ;
        
    } else if (indexPath.row == 2) {
        
        AccountSetupMessageViewController *accountSetupMessageViewController = [[AccountSetupMessageViewController alloc]init];
        //切换界面   NO：取消动画    不会卡页面
        [self.navigationController pushViewController:accountSetupMessageViewController animated:YES] ;
        
    } else if (indexPath.row == 4) {
        
        UIAlertController *cacheAlertController = [UIAlertController alertControllerWithTitle:@"缓存已清除" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:cacheAlertController animated:YES completion:nil];
        [self performSelector:@selector(dismiss:) withObject:cacheAlertController afterDelay:1.5];
    }
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*-------------------------消除缓存--------------------------*/
- (void)dismiss:(UIAlertController *)alert{
    [alert dismissViewControllerAnimated:YES completion:nil];
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
