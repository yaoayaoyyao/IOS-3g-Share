//
//  ShareSearch.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareSearch.h"
#import "BigWhiteViewController.h"

@interface ShareSearch ()<UITextFieldDelegate>

@property UITextField *shareSearchTextField;

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
    
    [self.view addSubview:_shareSearchTextField];
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
