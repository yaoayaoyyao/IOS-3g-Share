//
//  MessageChatDialogueViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/8/2.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "MessageChatDialogueViewController.h"

@interface MessageChatDialogueViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property UITableView *chatDialogueTableView;
@property UIView *chatDialogueView;
@property UITextView *chatDialogueTextView;
@property UIButton *chatDialogueButton;

@end

@implementation MessageChatDialogueViewController
- (void)textViewDidBeginEditing:(UITextView *)textView{
    CGFloat offset = self.view.frame.size.height - (_chatDialogueView.frame.origin.y+_chatDialogueView.frame.size.height+240);
    NSLog(@"%f", _chatDialogueView.frame.origin.y);
    if (offset <= 0) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            frame.origin.y = offset;
            self.view.frame = frame;
        }];
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.tag == 100) {
        NSLog(@"111111%f %f",self.view.frame.origin.y, _chatDialogueView.frame.origin.y);
        [UIView animateWithDuration:0.3 animations:^{
            self.view.frame = CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height);
        }];
        NSLog(@"222222%f %f",self.view.frame.origin.y, _chatDialogueView.frame.origin.y);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_chatDialogueTextView resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark -- 导航栏
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    [leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    self.navigationItem.title = @"与share小兰对话";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;

#pragma mark -- 发送栏
    _chatDialogueView = [[UIView alloc]initWithFrame:CGRectMake(0, 660, 375, 64)];
    _chatDialogueView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_chatDialogueView];
    
    _chatDialogueTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, 10, 295, 30)];
    _chatDialogueTextView.layer.cornerRadius = 10;
    _chatDialogueTextView.tag = 100;
    _chatDialogueTextView.editable = YES;
    _chatDialogueTextView.delegate = self;
    _chatDialogueTextView.returnKeyType = UIReturnKeyDone;
    [_chatDialogueView addSubview:_chatDialogueTextView];
    
    _chatDialogueButton = [[UIButton alloc]initWithFrame:CGRectMake( 315, 10, 45, 30)];
    [_chatDialogueButton setTitle:@"发送" forState:UIControlStateNormal];
    [_chatDialogueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _chatDialogueButton.backgroundColor = [UIColor colorWithRed:0.23f green:0.56f blue:0.80f alpha:1.00f];
    _chatDialogueButton.layer.cornerRadius = 8;
    _chatDialogueButton.layer.masksToBounds = YES;
    [_chatDialogueView addSubview:_chatDialogueButton];
    
    
}

- (void)pressLeft{
    [self.navigationController popViewControllerAnimated:YES];
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
