//
//  AccountMessageChatViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageChatViewController.h"
#import "AccountMessageChatTableViewCell.h"
#import "MessageChatDialogue/MessageChatDialogueViewController.h"

@interface AccountMessageChatViewController ()<UITableViewDelegate, UITableViewDataSource>

@property UITableView *accountMessageChatTableView;
@property AccountMessageChatTableViewCell *accountMessageChatTableViewCell;

@end

@implementation AccountMessageChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"私信" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
/*--------------------------单元格----------------------------*/
    _accountMessageChatTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _accountMessageChatTableView.delegate = self;
    _accountMessageChatTableView.dataSource = self;
    [self.view addSubview:_accountMessageChatTableView];
    _accountMessageChatTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*--------------------------单元格----------------------------*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *leftImageArray = [NSMutableArray arrayWithObjects:@"sixin_img1.png", @"sixin_img2.png", @"sixin_img3.png", @"sixin_img4.png", nil];
    NSMutableArray *nameLabelArray = [NSMutableArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", nil];
    NSMutableArray *chatLabelArray = [NSMutableArray arrayWithObjects:@"你的作品我很喜欢！！！", @"谢谢，已关注你", @"为你点赞", @"你好，可以问问你是怎么拍的吗？", nil];
    NSMutableArray *timeLabelArray = [NSMutableArray arrayWithObjects:@"11-03 09:45", @"11-03 10:00", @"11-03 10:23", @"11—03 11:20", nil];
    
    _accountMessageChatTableViewCell = [[AccountMessageChatTableViewCell alloc]init];
    _accountMessageChatTableViewCell.leftImageView.image = [UIImage imageNamed:[leftImageArray objectAtIndex:indexPath.row]];
    _accountMessageChatTableViewCell.nameLabel.text = [nameLabelArray objectAtIndex:indexPath.row];
    _accountMessageChatTableViewCell.chatLabel.text = [chatLabelArray objectAtIndex:indexPath.row];
    _accountMessageChatTableViewCell.timeLabel.text = [timeLabelArray objectAtIndex:indexPath.row];
    
    _accountMessageChatTableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    
    return _accountMessageChatTableViewCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.hidesBottomBarWhenPushed = YES;
    if (indexPath.row == 1) {
        MessageChatDialogueViewController *messageChatDialogueViewController = [[MessageChatDialogueViewController alloc]init];
        [self.navigationController pushViewController:messageChatDialogueViewController animated:YES];
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
