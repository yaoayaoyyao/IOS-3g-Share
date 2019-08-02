//
//  ShareArticle.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareArticle.h"
#import "ShareMainTableViewCell.h"

@interface ShareArticle ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property UISegmentedControl *articleSegmentedControl;
@property UIScrollView *articleScrollView;
@property UITableView *choicenessTableView;
@property UITableView *hotTableView;
@property UITableView *allTableView;


@end

@implementation ShareArticle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
/*---------------------导航栏-----------------------*/
    self.navigationItem.title = @"文章" ;
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
    
/*---------------------选择卡-----------------------*/
    _articleSegmentedControl = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"精选文章", @"热门推荐", @"全部文章", nil]];
    _articleSegmentedControl.frame = CGRectMake(0, 0, 375, 38);
    _articleSegmentedControl.selectedSegmentIndex = 2;
    //背景添加图片
    [_articleSegmentedControl setBackgroundImage:[UIImage imageNamed:@"essay_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //在点击后是否恢复原样
    _articleSegmentedControl.momentary = NO;
    [_articleSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor] , NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20]} forState:UIControlStateNormal];
    [_articleSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.45f green:0.45f blue:0.45f alpha:1.00f], NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20]} forState:UIControlStateSelected];
    [_articleSegmentedControl setDividerImage:[UIImage imageNamed:@"essay_line.png"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_articleSegmentedControl addTarget:self action:@selector(changeTableView:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_articleSegmentedControl];
    
/*---------------------滚动视图-----------------------*/
    _articleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, 375, 812)];
    _articleScrollView.tag = 110;
    //监控目前滚动的位置
    [_articleScrollView setContentOffset:CGPointMake(750, 0) animated:YES];
    _articleScrollView.contentSize = CGSizeMake(375 * 3, 812);
    _articleScrollView.delegate = self;
    _articleScrollView.bounces = NO;
    _articleScrollView.showsHorizontalScrollIndicator = NO;
    _articleScrollView.pagingEnabled = YES;
    [self.view addSubview:_articleScrollView];
    
/*---------------------单元格-----------------------*/
    _choicenessTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 812) style:UITableViewStyleGrouped];
    _choicenessTableView.delegate = self;
    _choicenessTableView.dataSource = self;
    _choicenessTableView.tag = 1;
    [_articleScrollView addSubview:_choicenessTableView];
    
    _hotTableView = [[UITableView alloc]initWithFrame:CGRectMake(375, 0, 375, 812) style:UITableViewStyleGrouped];
    _hotTableView.delegate = self;
    _hotTableView.dataSource = self;
    _hotTableView.tag = 2;
    [_articleScrollView addSubview:_hotTableView];
    
    _allTableView = [[UITableView alloc]initWithFrame:CGRectMake(750, 0, 375, 812) style:UITableViewStyleGrouped];
    _allTableView.delegate = self;
    _allTableView.dataSource = self;
    _allTableView.tag = 3;
    [_articleScrollView addSubview:_allTableView];
    
}

/*---------------------选择卡-----------------------*/
- (void)changeTableView:(UISegmentedControl *)segmentedControl{
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_articleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    else if (segmentedControl.selectedSegmentIndex == 1) {
        [_articleScrollView setContentOffset:CGPointMake(375, 0) animated:YES];
    }
    else if (segmentedControl.selectedSegmentIndex == 2) {
        [_articleScrollView setContentOffset:CGPointMake(750, 0) animated:YES];
    }
}

/*---------------------滚动视图-----------------------*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 110) {
        if (scrollView.contentOffset.x == 0) {
            _articleSegmentedControl.selectedSegmentIndex = 0;
        }
        else if (scrollView.contentOffset.x == 375) {
            _articleSegmentedControl.selectedSegmentIndex = 1;
        }
        else if(scrollView.contentOffset.x == 750) {
            _articleSegmentedControl.selectedSegmentIndex = 2;
        }
    }
}

#pragma mark -- 单元格
/*---------------------单元格-----------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
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
    ShareMainTableViewCell *shareMainTableViewCell1 = [[ShareMainTableViewCell alloc]init];
    ShareMainTableViewCell *shareMainTableViewCell2 = [[ShareMainTableViewCell alloc]init];
    ShareMainTableViewCell *shareMainTableViewCell3 = [[ShareMainTableViewCell alloc]init];
    
    shareMainTableViewCell1.LeftImageView.image = [UIImage imageNamed:@"note_img1.png"];
    shareMainTableViewCell1.NameLabel.text = @"关于设计反馈的5件事\nshare小白";
    shareMainTableViewCell1.TypeLabel.text = @"设计文章-原创-理论";
    shareMainTableViewCell1.TimeLabel.text = @"16分钟前";
    [shareMainTableViewCell1.GoodButton setTitle:@"102" forState:UIControlStateNormal];
    [shareMainTableViewCell1.FanButton setTitle:@"26" forState:UIControlStateNormal];

    shareMainTableViewCell2.LeftImageView.image = [UIImage imageNamed:@"note_img2.png"];
    shareMainTableViewCell2.NameLabel.text = @"用户设计PK战！\n脸书vs人人  share小王";
    shareMainTableViewCell2.TypeLabel.text = @"设计文章-原创-Web/Flash";
    shareMainTableViewCell2.TimeLabel.text = @"17分钟前";
    [shareMainTableViewCell2.GoodButton setTitle:@"102" forState:UIControlStateNormal];
    [shareMainTableViewCell2.FanButton setTitle:@"26" forState:UIControlStateNormal];

    shareMainTableViewCell3.LeftImageView.image = [UIImage imageNamed:@"note_img3.png"];
    shareMainTableViewCell3.NameLabel.text = @"字体故事    share小吕";
    shareMainTableViewCell3.TypeLabel.text = @"设计文章-原创-设计观点";
    shareMainTableViewCell3.TimeLabel.text = @"45分钟前";
    [shareMainTableViewCell3.GoodButton setTitle:@"102" forState:UIControlStateNormal];
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
