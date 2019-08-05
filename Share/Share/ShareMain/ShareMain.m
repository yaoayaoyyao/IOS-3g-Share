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

@interface ShareMain ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate ,
UIScrollViewAccessibilityDelegate>

@property UITableView *shareMainTableView;
@property ShareMainTableViewCell *shareMainTableViewCell;
@property NSMutableArray *flagOfGoodButtonMutableArray;
@property NSMutableArray *GoodButtonMutableArray;
@property NSArray *arrayBefore;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ShareMain

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _flagOfGoodButtonMutableArray = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", nil];
    _GoodButtonMutableArray = [NSMutableArray arrayWithObjects:@"102", @"102", @"45", @"66", nil];
    _arrayBefore = [NSArray arrayWithObjects:@"103", @"103", @"46", @"67", nil];
    /*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"SHARE" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    self.navigationController.navigationBar.alpha = 1;
    //改变导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
    /*---------------------单元格-----------------------*/
    _shareMainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _shareMainTableView.delegate = self;
    _shareMainTableView.dataSource = self;
    _shareMainTableView.tag = 111;
    [self.view addSubview:_shareMainTableView];
    UIView *view = [[UIView alloc]initWithFrame: CGRectMake( 10, 0, 355, 179)];
    
/*---------------------轮播图-----------------------*/
    //设置滚动视图的主体
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, 355, 179)];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    //横竖两种滚轮都不显示
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
    
    for (int i = 1; i < 5; ++i) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake((i - 1) *  355, 0, 355, 179)];
        
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"main_img%d.png", i]];
        [_scrollView addSubview:imageView];
    }
    
    //设置第五张图片和第一张图片相同
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake( 4 *  355, 0, 355, 179)];
    
    imageView.image = [UIImage imageNamed:@"main_img1.png"];
    [_scrollView addSubview:imageView];
    
    _scrollView.contentSize = CGSizeMake(355 * 5, 179);
    
    [view addSubview:_scrollView];
    
    //设置时钟
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeView) userInfo:nil repeats:YES];
    
    //设置视图上的小圆点
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 140, 355, 30)];
    _pageControl.numberOfPages = 4;
    _pageControl.currentPage = 0;
    
    [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    
    [view addSubview:_pageControl];
    
    _shareMainTableView.tableHeaderView = view;
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
    NSArray *NameLabelArray = [NSArray arrayWithObjects:@"假日                 share小白", @"国外画册欣赏\nshare小王", @"collection扁平设计\nshare小王", @"版式整理术：高效解决多风格\n要求               share小于", nil];
    NSArray *TypeLabelArray = [NSArray arrayWithObjects:@"原创-插画-练习作品", @"平面设计-画册设计", @"平面设计-海报设计", @"原创-平面设计", nil];
    NSArray *TimeLabelArray = [NSArray arrayWithObjects:@"15分钟前", @"16分钟前", @"17分钟前", @"1小时前", nil];
    NSArray *FanButtonArray = [NSArray arrayWithObjects:@"26", @"26", @"105", @"233", nil];

    
    _shareMainTableViewCell.LeftImageView.image = [UIImage imageNamed:[LeftImageArray objectAtIndex:indexPath.section]];
    _shareMainTableViewCell.NameLabel.text = [NameLabelArray objectAtIndex:indexPath.section];
    _shareMainTableViewCell.TypeLabel.text = [TypeLabelArray objectAtIndex:indexPath.section];
    _shareMainTableViewCell.TimeLabel.text = [TimeLabelArray objectAtIndex:indexPath.section];
    [_shareMainTableViewCell.FanButton setTitle:[FanButtonArray objectAtIndex:indexPath.section] forState:UIControlStateNormal];
    
    [_shareMainTableViewCell.GoodButton addTarget:self action:@selector(changeNumbel:) forControlEvents:UIControlEventTouchUpInside];
    
    _shareMainTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    if ([_flagOfGoodButtonMutableArray[indexPath.section] isEqualToString:@"1"]) {
        [_shareMainTableViewCell.GoodButton setImage:[UIImage imageNamed:@"button_zanok.png"] forState:UIControlStateNormal];
        [_shareMainTableViewCell.GoodButton setTitle:_arrayBefore[_shareMainTableViewCell.GoodButton.tag] forState:UIControlStateNormal];
    }
    else{
        [_shareMainTableViewCell.GoodButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
        [_shareMainTableViewCell.GoodButton setTitle:_GoodButtonMutableArray[_shareMainTableViewCell.GoodButton.tag] forState:UIControlStateNormal];
    }
    
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
    if ([_flagOfGoodButtonMutableArray[btn.tag] isEqualToString:@"0"]) {
        _flagOfGoodButtonMutableArray[btn.tag] = @"1";
        [btn setTitle:_arrayBefore[btn.tag] forState:UIControlStateNormal];
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

/*-------------------------------轮播图------------------------------*/
//设置时钟调用的方法
- (void)changeView
{
    float resultPiontX = 0.0;
    //这里获取的信息是未翻页前的信息。
    //当前的点不在最后一页的时候，每次正常翻页，当是最后一页的时候，把最后一页变为第一页（小圆点当前页数设置为1，当前点设置为0.0）
    //注意：当前的计算点是下一页的点，当前计算的页数是下一页的页数
    int i = 1;
    if (_scrollView.contentOffset.x < 3 * 355) {
        i = _scrollView.contentOffset.x / 355 + 1;
    }
    else if (_scrollView.contentOffset.x == 3 * 355) {
        i = 0;
    }
    else {
        _scrollView.contentOffset = CGPointMake(0, 0);
    }
    
    _pageControl.currentPage = i;
    
    resultPiontX = _scrollView.contentOffset.x + 355;
    
    [_scrollView setContentOffset:CGPointMake( resultPiontX, 0) animated:YES];
}

//设置小圆点点击方法
- (void)pageTurn:(UIPageControl *)sender {
    [_scrollView setContentOffset:CGPointMake( sender.currentPage * 355, 0) animated:YES];
}

//当开始拖拽的时候停止时钟
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_timer setFireDate:[NSDate distantFuture]];
}

//当结束滚当时执行的方法，变更页数，并且在4秒后开始时钟
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //这里获取的信息是已经翻过页的信息
    int i = 0;
    if (_scrollView.contentOffset.x < 4 * 355) {
        i = scrollView.contentOffset.x / 355;
    }
    else {
        _scrollView.contentOffset = CGPointMake(0, 0);
        i = 0;
    }
    
    _pageControl.currentPage = i;
    
    [_timer setFireDate:[NSDate dateWithTimeInterval:4.0 sinceDate:[NSDate date]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-------------------------------透明度------------------------------*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 111) {
        CGFloat y = scrollView.contentOffset.y + 88;
        if (y > 0) {
            CGFloat alpha = y / 100;
            self.navigationController.navigationBar.alpha = 1 - alpha;
            self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
            //        self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
        }
        else if (y == 0) {
            self.navigationController.navigationBar.alpha = 1;
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
