//
//  AccountUploadViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/8/2.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountUploadViewController.h"
#import "ShareMainTableViewCell.h"

@interface AccountUploadViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property UISegmentedControl *accountUploadSegmentedControl;
@property UIScrollView *accountUploadScrollView;
@property UITableView *timeTableView;
@property UITableView *goodTableView;
@property UITableView *shareTableView;

@end

@implementation AccountUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我上传的" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];

#pragma mark --选择卡
    _accountUploadSegmentedControl = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"上传时间", @"推荐最多", @"分享最多", nil]];
    _accountUploadSegmentedControl.frame = CGRectMake(0, 0, 375, 38);
    [_accountUploadSegmentedControl setBackgroundImage:[UIImage imageNamed:@"essay_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    _accountUploadSegmentedControl.selectedSegmentIndex = 0;
    _accountUploadSegmentedControl.momentary = NO;
    [_accountUploadSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20]} forState:UIControlStateNormal];
    [_accountUploadSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.45f green:0.45f blue:0.45f alpha:1.00f], NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20]} forState:UIControlStateSelected];
    [_accountUploadSegmentedControl setDividerImage:[UIImage imageNamed:@"essay_line.png"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_accountUploadSegmentedControl addTarget:self action:@selector(changeTableView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_accountUploadSegmentedControl];
    
#pragma mark -- 滚动视图
    _accountUploadScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, 375, 812)];
    _accountUploadScrollView.contentSize = CGSizeMake(375 * 3, 812);
    _accountUploadScrollView.tag = 101;
    _accountUploadScrollView.delegate = self;
    _accountUploadScrollView.bounces = NO;
    _accountUploadScrollView.pagingEnabled = YES;
    _accountUploadScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_accountUploadScrollView];
    
#pragma mark -- 单元格
    _timeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 812) style:UITableViewStyleGrouped];
    _timeTableView.delegate = self;
    _timeTableView.dataSource = self;
    _timeTableView.tag = 1;
    [_accountUploadScrollView addSubview:_timeTableView];
    
    _goodTableView = [[UITableView alloc]initWithFrame:CGRectMake(375, 0, 375, 812) style:UITableViewStyleGrouped];
    _goodTableView.delegate = self;
    _goodTableView.dataSource = self;
    _goodTableView.tag = 2;
    [_accountUploadScrollView addSubview:_goodTableView];
    
    _shareTableView = [[UITableView alloc]initWithFrame:CGRectMake(750, 0, 375, 812) style:UITableViewStyleGrouped];
    _shareTableView.delegate = self;
    _shareTableView.dataSource = self;
    _shareTableView.tag = 3;
    [_accountUploadScrollView addSubview:_shareTableView];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    [self.navigationController popViewControllerAnimated:YES] ;
}
/*---------------------选择卡-----------------------*/
- (void)changeTableView:(UISegmentedControl *)segmentedControl{
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_accountUploadScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else if (segmentedControl.selectedSegmentIndex == 1) {
        [_accountUploadScrollView setContentOffset:CGPointMake(375, 0) animated:YES];
    }
    else if (segmentedControl.selectedSegmentIndex == 2) {
        [_accountUploadScrollView setContentOffset:CGPointMake(750, 0) animated:YES];
    }
}
#pragma mark -- 滚动视图
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 101) {
        if (scrollView.contentOffset.x == 0) {
            _accountUploadSegmentedControl.selectedSegmentIndex = 0;
        }
        else if (scrollView.contentOffset.x == 375) {
            _accountUploadSegmentedControl.selectedSegmentIndex = 1;
        }
        else if (scrollView.contentOffset.x == 750) {
            _accountUploadSegmentedControl.selectedSegmentIndex = 2;
        }
    }
}



#pragma mark -- 单元格
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
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
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShareMainTableViewCell *shareMainTableViewCell1 = [[ShareMainTableViewCell alloc]init];
    ShareMainTableViewCell *shareMainTableViewCell2 = [[ShareMainTableViewCell alloc]init];
    ShareMainTableViewCell *shareMainTableViewCell3 = [[ShareMainTableViewCell alloc]init];
    
    shareMainTableViewCell1.LeftImageView.image = [UIImage imageNamed:@"note_img1.png"];
    shareMainTableViewCell1.NameLabel.text = @"关于设计反馈的5件事\nshare小白";
    shareMainTableViewCell1.TypeLabel.text = @"设计文章-原创-理论";
    shareMainTableViewCell1.TimeLabel.text = @"16分钟前";
    [shareMainTableViewCell1.GoodButton setTitle:@"102" forState:UIControlStateNormal];
    shareMainTableViewCell1.selectionStyle = UITableViewCellEditingStyleNone;
    [shareMainTableViewCell1.FanButton setTitle:@"26" forState:UIControlStateNormal];
    
    shareMainTableViewCell2.LeftImageView.image = [UIImage imageNamed:@"note_img2.png"];
    shareMainTableViewCell2.NameLabel.text = @"用户设计PK战！\n脸书vs人人  share小王";
    shareMainTableViewCell2.TypeLabel.text = @"设计文章-原创-Web/Flash";
    shareMainTableViewCell2.TimeLabel.text = @"17分钟前";
    [shareMainTableViewCell2.GoodButton setTitle:@"102" forState:UIControlStateNormal];
    shareMainTableViewCell2.selectionStyle = UITableViewCellEditingStyleNone;
    [shareMainTableViewCell2.FanButton setTitle:@"26" forState:UIControlStateNormal];
    
    shareMainTableViewCell3.LeftImageView.image = [UIImage imageNamed:@"note_img3.png"];
    shareMainTableViewCell3.NameLabel.text = @"字体故事    share小吕";
    shareMainTableViewCell3.TypeLabel.text = @"设计文章-原创-设计观点";
    shareMainTableViewCell3.TimeLabel.text = @"45分钟前";
    [shareMainTableViewCell3.GoodButton setTitle:@"102" forState:UIControlStateNormal];
    shareMainTableViewCell3.selectionStyle = UITableViewCellEditingStyleNone;
    [shareMainTableViewCell3.FanButton setTitle:@"26" forState:UIControlStateNormal];
    
    if (tableView.tag == 1) {
        if (indexPath.section == 0) {
            return shareMainTableViewCell1;
        } else if (indexPath.section == 1){
            return shareMainTableViewCell2;
        } else {
            return shareMainTableViewCell3;
        }
    } else if (tableView.tag == 2) {
        if (indexPath.section == 0) {
            return shareMainTableViewCell2;
        } else if (indexPath.section == 1){
            return shareMainTableViewCell3;
        } else {
            return shareMainTableViewCell1;
        }
    } else {
        if (indexPath.section == 0) {
            return shareMainTableViewCell3;
        } else if (indexPath.section == 1){
            return shareMainTableViewCell1;
        } else {
            return shareMainTableViewCell2;
        }
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
