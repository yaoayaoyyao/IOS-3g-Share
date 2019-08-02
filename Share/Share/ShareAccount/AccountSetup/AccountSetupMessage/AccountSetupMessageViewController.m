//
//  AccountSetupMessageViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupMessageViewController.h"
#import "AccountSetupMessageTableViewCell.h"

@interface AccountSetupMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *accountSetupMessageTableView;
@property NSMutableArray *flagOfCell;

@end

@implementation AccountSetupMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _flagOfCell = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", nil];
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"消息设置" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
/*---------------------单元格-----------------------*/
    _accountSetupMessageTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountSetupMessageTableView.delegate = self;
    _accountSetupMessageTableView.dataSource = self;
    
    [self.view addSubview:_accountSetupMessageTableView];
    _accountSetupMessageTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*---------------------单元格-----------------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *accountSetupMutableArray = [NSMutableArray arrayWithObjects:@"接受新消息通知", @"通知显示栏", @"声音", @"振动", @"关注更新", nil];
    
    AccountSetupMessageTableViewCell *accountSetupMessageTableViewCell = [[AccountSetupMessageTableViewCell alloc] init];
    accountSetupMessageTableViewCell.messageLabel.text = [accountSetupMutableArray objectAtIndex:indexPath.row];
    accountSetupMessageTableViewCell.messageButton.tag = indexPath.row;
    [accountSetupMessageTableViewCell.messageButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    
    accountSetupMessageTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    return accountSetupMessageTableViewCell;
}


//按钮点击事件
- (void)change:(UIButton *)btn{
    if ([_flagOfCell[btn.tag] isEqualToString:@"0"]) {
        _flagOfCell[btn.tag] = @"1";
        [btn setImage:[UIImage imageNamed:@"my_button_pressed.png"] forState:UIControlStateNormal];
    }
    else{
        _flagOfCell[btn.tag] = @"0";
        [btn setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
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
