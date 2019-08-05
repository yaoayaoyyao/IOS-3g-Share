//
//  AccountSetupIntroductionViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupIntroductionViewController.h"
#import "IntroductionImageTableViewCell.h"
#import "IntroductionLabelTableViewCell.h"
#import "IntroductionButtonTableViewCell.h"

@interface AccountSetupIntroductionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *introductionTableView;
@property NSInteger *flag;
@property IntroductionButtonTableViewCell *introductionButtonTableViewCell;

@end

@implementation AccountSetupIntroductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _flag = 0;
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"基本资料" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
    
/*---------------------单元格-----------------------*/
    _introductionTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _introductionTableView.delegate = self;
    _introductionTableView.dataSource = self;
    [self.view addSubview:_introductionTableView];
    _introductionTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*--------------------------单元格---------------------------*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 120;
    }
    else{
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
        IntroductionImageTableViewCell *introductionImageTableViewCell = [[IntroductionImageTableViewCell alloc]init];
        introductionImageTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
        return introductionImageTableViewCell;
        
    } else if (indexPath.row == 3){
        
        _introductionButtonTableViewCell = [[IntroductionButtonTableViewCell alloc]init];
        if (_flag == 0) {
            [_introductionButtonTableViewCell.manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
            [_introductionButtonTableViewCell.womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        }
        else {
            [_introductionButtonTableViewCell.manButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
            [_introductionButtonTableViewCell.womanButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
        }
        [_introductionButtonTableViewCell.manButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [_introductionButtonTableViewCell.womanButton addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        _introductionButtonTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
        return _introductionButtonTableViewCell;
        
    } else{
        
        NSMutableArray *nameArray = [NSMutableArray arrayWithObjects:@"", @"昵称", @"签名", @"", @"邮箱", nil];
        NSMutableArray *contentArray = [NSMutableArray arrayWithObjects:@"", @"share小白", @"开心了就笑，不开心了就过会儿再笑", @"", @"186####3@qq.com", nil];
        
        IntroductionLabelTableViewCell *introductionLabelTableViewCell = [[IntroductionLabelTableViewCell alloc]init];
        introductionLabelTableViewCell.nameLabel.text = [nameArray objectAtIndex:indexPath.row];
        introductionLabelTableViewCell.contentLabel.text = [contentArray objectAtIndex:indexPath.row];
        
        introductionLabelTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
        return introductionLabelTableViewCell;
        
    }
}

- (void)change:(UIButton *)btn{
    if (_flag == 0) {
        _flag = 1;
        [_introductionButtonTableViewCell.manButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        [_introductionButtonTableViewCell.womanButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
    }
    else {
        _flag = 0;
        [_introductionButtonTableViewCell.manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
        [_introductionButtonTableViewCell.womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
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
