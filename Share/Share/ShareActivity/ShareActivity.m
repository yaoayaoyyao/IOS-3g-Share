//
//  ShareActivity.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareActivity.h"
#import "ShareActivityTableViewCell.h"

@interface ShareActivity ()<UITableViewDelegate,UITableViewDataSource>

@property UITableView *shareActivityTableView;

@end

@implementation ShareActivity

/*-------------------------------单元格------------------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* view = [[UIView alloc] init] ;
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView* view = [[UIView alloc] init] ;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    else{
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return 0;
    }
    else {
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 209;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShareActivityTableViewCell *shareActivityTableViewCell = [[ShareActivityTableViewCell alloc] init];
    NSArray *arrayButtonImage = [NSArray arrayWithObjects:@"main_img1.png", @"main_img2.png", @"main_img3.png", @"main_img4.png", nil];
    NSArray *arrayLabel = [NSArray arrayWithObjects:@" ”众乐纪”画出一首歌的模样", @" 下厨也要美美的，从一条围裙开始的围裙创意设计大赛", @" MIUI主题市场让b你的创意改变世界！", @" Good Night", nil];
    [shareActivityTableViewCell.activityButton setImage:[UIImage imageNamed:[arrayButtonImage objectAtIndex:indexPath.section]] forState:UIControlStateNormal];
    shareActivityTableViewCell.activitylabel.text = [arrayLabel objectAtIndex:indexPath.section];
    return shareActivityTableViewCell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"活动" ;
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
    _shareActivityTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _shareActivityTableView.delegate = self;
    _shareActivityTableView.dataSource = self;
    [self.view addSubview:_shareActivityTableView];
    //解决底部遮盖问题
    _shareActivityTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth ;
    
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
