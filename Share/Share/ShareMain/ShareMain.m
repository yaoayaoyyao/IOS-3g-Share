//
//  ShareMain.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareMain.h"
#import "ShareMainTableViewCell.h"
#import "MainHoliday/MainHolidayViewController.h"

@interface ShareMain ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *shareMainTableView;
@property ShareMainTableViewCell *shareMainTableViewCell;
@property NSMutableArray *flagOfGoodButtonMutableArray;
@property NSMutableArray *GoodButtonMutableArray;

@end

@implementation ShareMain

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _flagOfGoodButtonMutableArray = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", nil];
    _GoodButtonMutableArray = [NSMutableArray arrayWithObjects:@"102", @"102", @"45", @"66", nil];
    /*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"SHARE" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    //改变导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO ;
    
    //隐藏导航栏底部分界线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImage"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    /*---------------------单元格-----------------------*/
    _shareMainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _shareMainTableView.delegate = self;
    _shareMainTableView.dataSource = self;
    [self.view addSubview:_shareMainTableView];
}


/*-------------------------------单元格------------------------------*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _shareMainTableViewCell = [[ShareMainTableViewCell alloc]init];
    
    if (indexPath.section == 0) {
        _shareMainTableViewCell.GoodButton.tag = 0;
    }
    else if (indexPath.section == 1){
        _shareMainTableViewCell.GoodButton.tag = 1;
    }
    else if (indexPath.section == 2) {
        _shareMainTableViewCell.GoodButton.tag = 2;
    }
    else{
        _shareMainTableViewCell.GoodButton.tag = 3;
    }
    
    NSArray *LeftImageArray = [NSArray arrayWithObjects:@"list_img1.png", @"list_img2.png", @"list_img3.png", @"list_img4 .png", nil];
    NSArray *TypeLabelArray = [NSArray arrayWithObjects:@"原创-插画-练习作品", @"平面设计-画册设计", @"平面设计-海报设计", @"原创-平面设计", nil];
    NSArray *TimeLabelArray = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"1小时前", nil];
    NSArray *FanButtonArray = [NSArray arrayWithObjects:@"26", @"26", @"105", @"233", nil];
    
    
    _shareMainTableViewCell.LeftImageView.image = [UIImage imageNamed:[LeftImageArray objectAtIndex:indexPath.section]];
    _shareMainTableViewCell.TypeLabel.text = [TypeLabelArray objectAtIndex:indexPath.section];
    _shareMainTableViewCell.TimeLabel.text = [TimeLabelArray objectAtIndex:indexPath.section];
    [_shareMainTableViewCell.GoodButton setTitle:[_GoodButtonMutableArray objectAtIndex:indexPath.section] forState:UIControlStateNormal];
    [_shareMainTableViewCell.FanButton setTitle:[FanButtonArray objectAtIndex:indexPath.section] forState:UIControlStateNormal];
    
    [_shareMainTableViewCell.GoodButton addTarget:self action:@selector(changeNumbel:) forControlEvents:UIControlEventTouchUpInside];
    
    _shareMainTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    return _shareMainTableViewCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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

//选中 cell 时触发的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        self.hidesBottomBarWhenPushed = YES;
        
        MainHolidayViewController *mainHolidayViewController = [[MainHolidayViewController alloc]init];
        [self.navigationController pushViewController:mainHolidayViewController animated:YES];
        
    }
    
}

//按钮点击事件
- (void)changeNumbel:(UIButton *)btn{
    NSArray *arrayBefore = [NSArray arrayWithObjects:@"103", @"103", @"46", @"67", nil];
    if ([_flagOfGoodButtonMutableArray[btn.tag] isEqualToString:@"0"]) {
        _flagOfGoodButtonMutableArray[btn.tag] = @"1";
        [btn setTitle:arrayBefore[btn.tag] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"button_zanok.png"] forState:UIControlStateNormal];
    }
    else{
        _flagOfGoodButtonMutableArray[btn.tag] = @"0";
        [btn setTitle:_GoodButtonMutableArray[btn.tag] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    }
}
//分栏控制器
- (void)viewDidDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
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
