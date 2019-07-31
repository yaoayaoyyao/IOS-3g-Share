//
//  AccountMessageFanViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageFanViewController.h"
#import "AccountMessageFanTableViewCell.h"

@interface AccountMessageFanViewController ()<UITableViewDelegate, UITableViewDataSource>

@property UITableView *accountMessageFanTableView;
@property AccountMessageFanTableViewCell *accountMessageFanTableViewCell;

@end

@implementation AccountMessageFanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"新关注的" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
/*--------------------------单元格----------------------------*/
    _accountMessageFanTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountMessageFanTableView.delegate = self;
    _accountMessageFanTableView.dataSource = self;
    [self.view addSubview:_accountMessageFanTableView];
    
    _accountMessageFanTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
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
    return 6;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _accountMessageFanTableViewCell = [[AccountMessageFanTableViewCell alloc]init];
    
    NSMutableArray *leftImageArray = [NSMutableArray arrayWithObjects:@"sixin_img1.png", @"sixin_img2.png", @"sixin_img3.png", @"sixin_img4.png", @"guanzhu_img5.png", @"guanzhu_img6.png", nil];
    NSMutableArray *nameLabelArray = [NSMutableArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"sharetLity", nil];
    NSMutableArray *rightImageArray = [NSMutableArray arrayWithObjects:@"guanzhu_pressed.png", @"guanzhu_pressed.png", @"guanzhu_pressed.png", @"guanzhu_pressed.png", @"guanzhu_normal.png", @"guanzhu_normal.png", nil];
    
    _accountMessageFanTableViewCell.leftImageView.image = [UIImage imageNamed:[leftImageArray objectAtIndex:indexPath.row]];
    _accountMessageFanTableViewCell.nameLabel.text = [nameLabelArray objectAtIndex:indexPath.row];
    _accountMessageFanTableViewCell.rightImageView.image = [UIImage imageNamed:[rightImageArray objectAtIndex:indexPath.row]];
    
    _accountMessageFanTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return _accountMessageFanTableViewCell;
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
