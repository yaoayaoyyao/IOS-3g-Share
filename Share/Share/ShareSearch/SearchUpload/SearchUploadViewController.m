//
//  SearchUploadViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/8/1.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "SearchUploadViewController.h"
#import "SearchUploadImage/SearchUploadImageViewController.h"

@interface SearchUploadViewController ()<UIScrollViewDelegate,UITextViewDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property UIScrollView *searchUploadScrollView;
@property UITextField *nameTextField;
@property UITextView *contentTextView;
@property UITableView *searchUploadTableView;
@property NSInteger flag;
@property NSMutableArray *uploadMutableArray;
@property NSMutableArray *upMutableArray;

@end

@implementation SearchUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
/*--------------------------滚动视图---------------------------*/
    _searchUploadScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _searchUploadScrollView.contentSize = CGSizeMake(375, 812);
    _searchUploadScrollView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    _searchUploadScrollView.delegate = self;
    _searchUploadScrollView.bounces = NO;
    [self.view addSubview:_searchUploadScrollView];
    

/*--------------------------图片---------------------------*/
    UIButton *imageButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 200, 100)];
    [imageButton setTitle:@"选择图片" forState:UIControlStateNormal];
    [imageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    imageButton.backgroundColor = [UIColor colorWithRed:0.83f green:0.83f blue:0.84f alpha:1.00f];
    [imageButton addTarget:self action:@selector(choosePicture) forControlEvents:UIControlEventTouchUpInside];
    [_searchUploadScrollView addSubview:imageButton];
    
    UIImageView *locationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(230, 25, 110, 30)];
    locationImageView.image = [UIImage imageNamed:@"dizhi.png"];
    [_searchUploadScrollView addSubview:locationImageView];
    
    UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 120, 375, 10)];
    lineImageView.image = [UIImage imageNamed:@"线.png"];
    [_searchUploadScrollView addSubview:lineImageView];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 220, 375, 30)];
    _nameTextField.placeholder = @"  作品名称";
    _nameTextField.delegate = self;
    _nameTextField.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:_nameTextField];
    
    _contentTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 260, 375, 100)];
    _contentTextView.delegate = self;
    _contentTextView.text = @"请添加作品说明/文章内容......";
    _contentTextView.textColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.82f alpha:1.00f];
    _contentTextView.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:_contentTextView];
    
    UIButton *sentButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 370, 355, 40)];
    [sentButton setTitle:@"发布" forState:UIControlStateNormal];
    [sentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sentButton.backgroundColor = [UIColor colorWithRed:0.23f green:0.56f blue:0.80f alpha:1.00f];
    [_searchUploadScrollView addSubview:sentButton];
    
/*--------------------------标签---------------------------*/
    for (int i = 0; i < 4; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", nil];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10 + 91.25 * i, 140, 81.25, 30)];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_searchUploadScrollView addSubview:btn];
    }
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 180, 90, 30)];
    [btn1 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.layer.cornerRadius = 5;
    btn1.layer.masksToBounds = YES;
    btn1.titleLabel.font = [UIFont systemFontOfSize:15];
    btn1.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(110, 180, 76.875, 30)];
    [btn2 setTitle:@"影视" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.layer.cornerRadius = 5;
    btn2.layer.masksToBounds = YES;
    btn2.titleLabel.font = [UIFont systemFontOfSize:15];
    btn2.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(196.875, 180, 76.875, 30)];
    [btn3 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn3.layer.cornerRadius = 5;
    btn3.layer.masksToBounds = YES;
    btn3.titleLabel.font = [UIFont systemFontOfSize:15];
    btn3.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(283.75, 180, 81.25, 30)];
    [btn4 setTitle:@"其他" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn4.layer.cornerRadius = 5;
    btn4.layer.masksToBounds = YES;
    btn4.titleLabel.font = [UIFont systemFontOfSize:15];
    btn4.backgroundColor = [UIColor whiteColor];
    [_searchUploadScrollView addSubview:btn4];
    
#pragma mark ----单元格收起展开
    _flag = 0;
    _uploadMutableArray = [NSMutableArray arrayWithObjects:@"原创作品", @"设计资料", @"设计师观点", @"教程", nil];
    _upMutableArray = [NSMutableArray arrayWithObjects:@"原创作品", nil];
    _searchUploadTableView = [[UITableView alloc]initWithFrame:CGRectMake(220, 70, 120, 30) style:UITableViewStylePlain];
    _searchUploadTableView.delegate = self;
    _searchUploadTableView.dataSource = self;
    _searchUploadTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [_searchUploadScrollView addSubview:_searchUploadTableView];
    
    UIButton *uploadButton = [[UIButton alloc]initWithFrame:CGRectMake(340, 70, 30, 30)];
    [uploadButton setImage:[UIImage imageNamed:@"cai.png"] forState:UIControlStateNormal];
    [uploadButton addTarget:self action:@selector(openTableView) forControlEvents:UIControlEventTouchUpInside];
    [_searchUploadScrollView addSubview:uploadButton];
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}

/*--------------------------uitextfield---------------------------*/
//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_nameTextField resignFirstResponder];
    [_contentTextView resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

/*--------------------------uitextview---------------------------*/
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    textView.text = @"";
    _contentTextView.textColor = [UIColor blackColor];
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"请添加作品说明/文章内容......";
        _contentTextView.textColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.82f alpha:1.00f];
    }
    return YES;
}

#pragma mark --上传图片
- (void)choosePicture{
    /*----------------跳下一界面时，不显示分栏控制器--------------------*/
    self.hidesBottomBarWhenPushed = YES ;

    SearchUploadImageViewController *searchUploadImageViewController = [[SearchUploadImageViewController alloc]init];
    [self.navigationController pushViewController:searchUploadImageViewController animated:YES];
}

#pragma mark --单元格
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_flag == 0) {
        return 1;
    }
    else{
        return 4;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc]init];
    if (_flag == 1) {
        _searchUploadTableView.frame = CGRectMake(220, 70, 120, 120);
        tableViewCell.textLabel.text = [_uploadMutableArray objectAtIndex:indexPath.row];
    }
    else{
        _searchUploadTableView.frame = CGRectMake(220, 70, 120, 30);
        tableViewCell.textLabel.text = [_upMutableArray objectAtIndex:indexPath.row];
    }

    tableViewCell.selectionStyle = UITableViewCellEditingStyleNone;
    return tableViewCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        _upMutableArray[0] = @"原创作品";
    } else if (indexPath.row == 1){
        _upMutableArray[0] = @"设计资料";
    } else if (indexPath.row == 2) {
        _upMutableArray[0] = @"设计师观点";
    } else if (indexPath.row == 3){
        _upMutableArray[0] = @"教程";
    }
    if (_flag == 0) {
        _flag = 1;
        [_searchUploadTableView reloadData];
    } else{
        _flag = 0;
        [_searchUploadTableView reloadData];
    }
}

- (void)openTableView{
    _upMutableArray[0] = @"原创作品";
    if (_flag == 0) {
        _flag = 1;
        [_searchUploadTableView reloadData];
    } else{
        _flag = 0;
        [_searchUploadTableView reloadData];
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
