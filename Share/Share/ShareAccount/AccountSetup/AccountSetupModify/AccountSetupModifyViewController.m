//
//  AccountSetupModifyViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupModifyViewController.h"
#import "AccountSetupModifyTableViewCell.h"

@interface AccountSetupModifyViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property UITableView *accountSetupModifyTableView;
@property AccountSetupModifyTableViewCell *accountSetupModifyTableViewCell;
@property UIButton *modifyButton;

@end

@implementation AccountSetupModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"修改密码" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
    
    
/*---------------------单元格-----------------------*/
    _accountSetupModifyTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountSetupModifyTableView.delegate = self;
    _accountSetupModifyTableView.dataSource = self;
    [self.view addSubview:_accountSetupModifyTableView];
    
    _accountSetupModifyTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}


/*---------------------单元格-----------------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 3) {
    NSMutableArray *modifyLabelMutableArray = [NSMutableArray arrayWithObjects:@"旧密码", @"新密码", @"确认密码", nil];
    NSMutableArray *modifyTextFieldmutableArray = [NSMutableArray arrayWithObjects:@"6-20英文或数字结合", @"6-20英文或数字结合", @"请再次确认输入密码", nil];
    
    _accountSetupModifyTableViewCell = [[AccountSetupModifyTableViewCell alloc] init];
    _accountSetupModifyTableViewCell.modifyLabel.text = [modifyLabelMutableArray objectAtIndex:indexPath.row];
    _accountSetupModifyTableViewCell.modifyTextField.placeholder = [modifyTextFieldmutableArray objectAtIndex:indexPath.row];
    _accountSetupModifyTableViewCell.modifyTextField.keyboardType = UIKeyboardTypeDefault;
    _accountSetupModifyTableViewCell.modifyTextField.delegate = self;
        _accountSetupModifyTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    //修改Placeholder字体的颜色
    [_accountSetupModifyTableViewCell.modifyTextField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    return _accountSetupModifyTableViewCell;
    }
    else{
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        _modifyButton = [[UIButton alloc]initWithFrame:CGRectMake(137, 30, 101, 40)];
        [_modifyButton setTitle:@"提交" forState:UIControlStateNormal];
        [_modifyButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        _modifyButton.backgroundColor = [UIColor blackColor];
        [_modifyButton.layer setCornerRadius:5];
        _modifyButton.layer.masksToBounds = YES;
        [cell.contentView addSubview:_modifyButton];
        //去除单个单元格分割线
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, _accountSetupModifyTableView.bounds.size.width);
        
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        return cell;
    }
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
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
