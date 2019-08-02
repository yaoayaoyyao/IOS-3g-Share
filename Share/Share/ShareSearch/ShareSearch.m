//
//  ShareSearch.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareSearch.h"
#import "BigWhiteViewController.h"
#import "SearchUpload/SearchUploadViewController.h"

@interface ShareSearch ()<UITextFieldDelegate>

@property UITextField *shareSearchTextField;
@property UIScrollView *shareSearchScrollView;

@end

@implementation ShareSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
/*---------------------导航栏-----------------------*/
    
    self.navigationItem.title = @"搜索" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    //改变导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
    //设置导航栏为不透明
    self.navigationController.navigationBar.translucent = NO ;
    
    //左边按钮
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:nil] ;
    [leftBarButtonItem setTintColor:[UIColor whiteColor]] ;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem ;
    //右边按钮
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"radio_button_note.png"] style:UIBarButtonItemStyleDone target:self action:@selector(upload)];
    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //隐藏导航栏底部分界线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImage"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
/*------------------搜索栏------------------*/
    _shareSearchTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 355, 50)];
    _shareSearchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _shareSearchTextField.keyboardType = UIKeyboardTypeDefault;
    _shareSearchTextField.delegate = self;
    _shareSearchTextField.returnKeyType = UIReturnKeySearch;
    
    //左边搜索图标总是显示
    _shareSearchTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"radio_button_search.png"]];
    //左边搜索图标的模式
    leftImageView.contentMode = UIViewContentModeCenter;
    _shareSearchTextField.leftView = leftImageView;
    
    _shareSearchTextField.placeholder = @"搜索 用户名 作品分类 文章";
    //修改Placeholder字体的颜色
    [_shareSearchTextField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    _shareSearchScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _shareSearchScrollView.contentSize = CGSizeMake(375, 812);
    _shareSearchScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_shareSearchScrollView];
    [_shareSearchScrollView addSubview:_shareSearchTextField];
    
    UIImageView *classifyImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 70, 355, 30)];
    classifyImageView.image = [UIImage imageNamed:@"lines1.png"];
    for (int i = 0; i < 4; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", nil];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10 + 91.25 * i, 110, 81.25, 30)];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
        [_shareSearchScrollView addSubview:btn];
    }
    [_shareSearchScrollView addSubview:classifyImageView];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 90, 30)];
    [btn1 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.layer.cornerRadius = 5;
    btn1.layer.masksToBounds = YES;
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    btn1.backgroundColor = [UIColor whiteColor];
    [btn1 addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
    [_shareSearchScrollView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 150, 76.875, 30)];
    [btn2 setTitle:@"影视" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 5;
    btn2.layer.masksToBounds = YES;
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
    [_shareSearchScrollView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(196.875, 150, 76.875, 30)];
    [btn3 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.layer.cornerRadius = 5;
    btn3.layer.masksToBounds = YES;
    btn3.titleLabel.font = [UIFont systemFontOfSize:15];
    btn3.backgroundColor = [UIColor whiteColor];
    [btn3 addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
    [_shareSearchScrollView addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(283.75, 150, 81.25, 30)];
    [btn4 setTitle:@"其他" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.layer.cornerRadius = 5;
    btn4.layer.masksToBounds = YES;
    btn4.titleLabel.font = [UIFont systemFontOfSize:15];
    btn4.backgroundColor = [UIColor whiteColor];
    [btn4 addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
    [_shareSearchScrollView addSubview:btn4];
    
    UIImageView *goodImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 190, 355, 30)];
    goodImageView.image = [UIImage imageNamed:@"lines2.png"];
    for (int i = 0; i < 4; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"人气最高", @"收藏最多", @"评论最多", @"编辑精选", nil];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10 + 91.25 * i, 230, 81.25, 30)];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
        [_shareSearchScrollView addSubview:btn];
    }
    [_shareSearchScrollView addSubview:goodImageView];
    UIImageView *timeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 270, 355, 30)];
    timeImageView.image = [UIImage imageNamed:@"lines3.png"];
    for (int i = 0; i < 4; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"30分钟前", @"1小时前", @"1月前", @"1年前", nil];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10 + 91.25 * i, 310, 81.25, 30)];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(changeButtonColor:) forControlEvents:UIControlEventTouchUpInside];
        [_shareSearchScrollView addSubview:btn];
    }
    [_shareSearchScrollView addSubview:timeImageView];
    
    
}

//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_shareSearchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if ([textField.text isEqualToString:@"大白"]) {
        BigWhiteViewController *bigWhiteViewController = [[BigWhiteViewController alloc]init];
        //切换界面   NO：取消动画    不会卡页面
        [self.navigationController pushViewController:bigWhiteViewController animated:NO] ;
        textField.text = @"";
    }
    return  YES;
}

/*---------------------导航栏右边按钮 上传-----------------------*/
- (void)upload{
    /*----------------跳下一界面时，不显示分栏控制器--------------------*/
    self.hidesBottomBarWhenPushed = YES ;
    
    SearchUploadViewController *searchUploadViewController = [[SearchUploadViewController alloc]init];
    [self.navigationController pushViewController:searchUploadViewController animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
}


- (void)changeButtonColor:(UIButton *)btn {
    if ([btn.backgroundColor isEqual:[UIColor whiteColor]]) {
        btn.backgroundColor = [UIColor colorWithRed:0.23f green:0.56f blue:0.80f alpha:1.00f];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    else{
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
