//
//  ShareSighUp.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareSighUp.h"
#import "ShareLogin.h"

@interface ShareSighUp ()<UITextFieldDelegate>

@property UITextField *userEmail;
@property (retain, nonatomic) UITextField *userName;
@property (retain, nonatomic) UITextField *userPassword;
@property (retain, nonatomic) UIButton *SighUp;

@end

@implementation ShareSighUp
//弹出键盘时，输入框上移至不被隐藏
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y+textField.frame.size.height+290+150);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
    return YES;
}
//回收键盘时，输入框恢复原来的位置
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.tag == 100) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = 0.0;
            self.view.frame = frame;
        }];
    }
    return YES;
}
//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userEmail resignFirstResponder];
    [_userName resignFirstResponder];
    [_userPassword resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

- (void)tabBarSighUp{
//    if ([_userEmail.text isEqualToString:@""] || [_userName.text isEqualToString:@""] || [_userPassword.text isEqualToString:@""]) {
//
//    }
//    else{
        ShareLogin *shareLogin = [[ShareLogin alloc] init];
        [self presentViewController:shareLogin animated:YES completion:nil];
//    }
}


/*-------------------------viewDidLoad-----------------------------*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.29f green:0.63f blue:0.88f alpha:1.00f];
    
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
    
    //邮箱
    _userEmail = [[UITextField alloc] initWithFrame:CGRectMake(62, 300, 251, 40)];
    _userEmail.borderStyle = UITextBorderStyleRoundedRect;
    _userEmail.keyboardType = UIKeyboardTypeDefault;
    _userEmail.delegate = self;
    ////邮箱左边图片
    _userEmail.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageEmail = [[UIImageView alloc] initWithFrame:CGRectMake(62, 300, 40, 40)];
    imageEmail.image = [UIImage imageNamed:@"email_img.png"];
    _userEmail.leftView = imageEmail;
    
    //用户名
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(62, 380, 251, 40)];
    _userName.borderStyle = UITextBorderStyleRoundedRect;
    _userName.keyboardType = UIKeyboardTypeDefault;
    _userName.delegate = self;
    ////用户名左边图片
    _userName.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imageName = [[UIImageView alloc] initWithFrame:CGRectMake(62, 380, 40, 40)];
    imageName.image = [UIImage imageNamed:@"user_img.png"];
    _userName.leftView = imageName;
    
    //密码
    _userPassword = [[UITextField alloc] initWithFrame:CGRectMake(62, 460, 251, 40)];
    _userPassword.borderStyle = UITextBorderStyleRoundedRect;
    _userPassword.keyboardType = UIKeyboardTypeDefault;
    _userPassword.tag = 100;
    _userPassword.secureTextEntry = YES;
    _userPassword.delegate = self;
    ////密码左边图片
    _userPassword.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *imagePassword = [[UIImageView alloc] initWithFrame:CGRectMake(62, 460, 40, 40)];
    imagePassword.image = [UIImage imageNamed:@"pass_img.png"];
    _userPassword.leftView = imagePassword;
    
    //确认注册按钮
    _SighUp = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _SighUp.frame = CGRectMake( 137, 530, 101, 30);
    [_SighUp setTitle:@"确认注册" forState:UIControlStateNormal];
    [_SighUp setTintColor:[UIColor whiteColor]];
    _SighUp.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    [_SighUp addTarget:self action:@selector(tabBarSighUp) forControlEvents:UIControlEventTouchUpInside];
    ////注册边框
    [_SighUp.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_SighUp.layer setBorderWidth:1.0];
    [_SighUp.layer setCornerRadius:5];
    _SighUp.layer.masksToBounds = YES;
    
    [self.view addSubview:icon];
    [self.view addSubview:share];
    [self.view addSubview:_userEmail];
    [self.view addSubview:_userName];
    [self.view addSubview:_userPassword];
    [self.view addSubview:_SighUp];
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
