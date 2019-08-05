//
//  ShareLogin.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/28.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareLogin.h"
#import "ShareMain.h"
#import "ShareSearch.h"
#import "ShareArticle.h"
#import "ShareActivity.h"
#import "ShareAccount.h"
#import "ShareSighUp.h"


@interface ShareLogin ()<UITextFieldDelegate,ShareSighUpDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UITextField *userName;
@property (retain, nonatomic) UITextField *userPassword;
@property (retain, nonatomic) UIButton *Login;
@property (retain, nonatomic) UIButton *SighUp;
@property UIButton *automatic;
@property NSInteger automaticInteger;

@end

@implementation ShareLogin
//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userName resignFirstResponder];
    [_userPassword resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

/*-------------------------viewDidLoad-----------------------------*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    _automaticInteger = 0;
    //图标
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(137.5, 120, 100, 100)];
    icon.image = [UIImage imageNamed:@"icon.png"];
    icon.layer.cornerRadius = 50;
    icon.layer.masksToBounds = YES;
    icon.backgroundColor = [UIColor whiteColor];
    
    //文字
    UILabel *share = [[UILabel alloc] initWithFrame:CGRectMake(137.5, 220, 100, 40)];
    share.text = @"SHARE";
    share.textColor = [UIColor whiteColor];
    share.textAlignment = NSTextAlignmentCenter;
    share.font = [UIFont fontWithName:@"HelveticaNeue" size:25];
    
    //用户名
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(62, 300, 251, 40)];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.delegate = self;
    ////用户名左边图片
    _userName.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageName = [[UIImageView alloc] initWithFrame:CGRectMake(62, 300, 40, 40)];
    imageName.image = [UIImage imageNamed:@"user_img.png"];
    _userName.leftView = imageName;
    
    //密码
    _userPassword = [[UITextField alloc] initWithFrame:CGRectMake(62, 360, 251, 40)];
    _userPassword.borderStyle = UITextBorderStyleRoundedRect;
    _userPassword.keyboardType = UIKeyboardTypeDefault;
    _userPassword.secureTextEntry = YES;
    _userPassword.delegate = self;
    ////密码左边图片
    _userPassword.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imagePassword = [[UIImageView alloc] initWithFrame:CGRectMake(62, 360, 40, 40)];
    imagePassword.image = [UIImage imageNamed:@"pass_img.png"];
    _userPassword.leftView = imagePassword;
    
    //登录按钮
    _Login = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _Login.frame = CGRectMake( 100, 430, 80, 30);
    [_Login setTitle:@"登录" forState:UIControlStateNormal];
    [_Login setTintColor:[UIColor whiteColor]];
    _Login.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [_Login addTarget:self action:@selector(tabBarLogin) forControlEvents:UIControlEventTouchUpInside];
    ////登录边框
    [_Login.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_Login.layer setBorderWidth:1.0];
    [_Login.layer setCornerRadius:5];
    _Login.layer.masksToBounds = YES;

    
    //注册按钮
    _SighUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _SighUp.frame = CGRectMake( 200, 430, 80, 30);
    [_SighUp setTitle:@"注册" forState:UIControlStateNormal];
    [_SighUp setTintColor:[UIColor whiteColor]];
    _SighUp.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [_SighUp addTarget:self action:@selector(tabBarSighUp) forControlEvents:UIControlEventTouchUpInside];
    ////注册边框
    [_SighUp.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_SighUp.layer setBorderWidth:1.0];
    [_SighUp.layer setCornerRadius:5];
    _SighUp.layer.masksToBounds = YES;
    
    //自动登录按钮
    _automatic = [[UIButton alloc]initWithFrame:CGRectMake(62, 480, 118, 30)];
    if (_automaticInteger == 0) {
        [_automatic setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
    }
    else{
        [_automatic setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
    }
    [_automatic setTitle:@"自动登录" forState:UIControlStateNormal];
    [_automatic addTarget:self action:@selector(automaticChange) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:icon];
    [self.view addSubview:share];
    [self.view addSubview:_userName];
    [self.view addSubview:_userPassword];
    [self.view addSubview:_Login];
    [self.view addSubview:_SighUp];
    [self.view addSubview:_automatic];
    
}

/*-------------------------登录-----------------------------*/
- (void)tabBarLogin{
    if ([_userName.text isEqualToString:@""] || [_userPassword.text isEqualToString:@""]) {
        
    }
    else{
        ShareMain *shareMain = [[ShareMain alloc] init];
        shareMain.tabBarItem.image = [[UIImage imageNamed:@"radio_button1_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shareMain.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        ShareSearch *shareSearch = [[ShareSearch alloc] init];
        shareSearch.tabBarItem.image = [[UIImage imageNamed:@"radio_button2_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shareSearch.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button2_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        ShareArticle *shareArticle = [[ShareArticle alloc] init];
        shareArticle.tabBarItem.image = [[UIImage imageNamed:@"radio_button3_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shareArticle.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button3_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        ShareActivity *shareActivity = [[ShareActivity alloc] init];
        shareActivity.tabBarItem.image = [[UIImage imageNamed:@"radio_button4_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shareActivity.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button4_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        ShareAccount *shareAccount = [[ShareAccount alloc] init];
        shareAccount.tabBarItem.image = [[UIImage imageNamed:@"radio_button5_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        shareAccount.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button5_pressed.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        UINavigationController *navMain = [[UINavigationController alloc]initWithRootViewController:shareMain];
        UINavigationController *navSSea = [[UINavigationController alloc]initWithRootViewController:shareSearch];
        UINavigationController *navSArt = [[UINavigationController alloc]initWithRootViewController:shareArticle];
        UINavigationController *navSAct = [[UINavigationController alloc]initWithRootViewController:shareActivity];
        UINavigationController *navSAcc = [[UINavigationController alloc]initWithRootViewController:shareAccount];
        
        NSArray *arrayNav = [NSArray arrayWithObjects:navMain, navSSea, navSArt, navSAct, navSAcc, nil];
        
        UITabBarController *TBC = [[UITabBarController alloc]init];
        TBC.tabBar.barTintColor = [UIColor blackColor];
        TBC.viewControllers = arrayNav;
        [self presentViewController:TBC animated:YES completion:nil];
    }
}

/*-------------------------注册-----------------------------*/
- (void)tabBarSighUp{
    ShareSighUp *shareSighUp = [[ShareSighUp alloc] init];
    shareSighUp.sighUpDelegate = self;
    [self presentViewController:shareSighUp animated:YES completion:nil];
}
- (void)Name:(NSString *)name andPassword:(NSString *)password{
    _userName.text = name;
    _userPassword.text = password;
}

- (void)automaticChange{
    if (_automaticInteger == 0) {
        _automaticInteger = 1;
        [_automatic setImage:[UIImage imageNamed:@"checkbox_checked.png"] forState:UIControlStateNormal];
    }
    else{
        _automaticInteger = 0;
            [_automatic setImage:[UIImage imageNamed:@"checkbox_unchecked.png"] forState:UIControlStateNormal];
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
