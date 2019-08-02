//
//  SearchUploadImageViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/8/1.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "SearchUploadImageViewController.h"

@interface SearchUploadImageViewController ()<UIScrollViewDelegate>

@property UIScrollView *uploadImageScrollView;
@property NSMutableArray *uploadImageMutableArray;
@property UIButton *buttonView;
@property UIImageView *imageView;

@end

@implementation SearchUploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    UIBarButtonItem *leftLabelBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择图片" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置字号
    [leftLabelBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Bold" size:20], NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    [leftLabelBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftImageBarButtonItem, leftLabelBarButtonItem, nil];
    
    //右边按钮
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStyleDone target:self action:@selector(upload)];
    [rightBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
/*--------------------------图片---------------------------*/
    _uploadImageMutableArray = [NSMutableArray arrayWithObjects:@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", nil];
    _uploadImageScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _uploadImageScrollView.contentSize = CGSizeMake(375, 812);
    _uploadImageScrollView.delegate = self;
    [self.view addSubview:_uploadImageScrollView];
    
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 3; j++) {
            UIButton *uploadImageButton = [[UIButton alloc]initWithFrame:CGRectMake(126 * j, 126 * i, 121, 121)];
//            uploadImageButton.tag = i * 3 + j;
            NSString *strName = [NSString stringWithFormat:@"%d.jpg", i * 3 + j + 1];
            [uploadImageButton setImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
            [_uploadImageScrollView addSubview:uploadImageButton];
            
            _buttonView = [[UIButton alloc]initWithFrame:uploadImageButton.frame];
            _buttonView.backgroundColor = [UIColor blackColor];
            _buttonView.alpha = 0.1;
            _buttonView.tag = i * 3 + j;
            [_uploadImageScrollView addSubview:_buttonView];
            _imageView = [[UIImageView alloc]init];
            _imageView.image = [UIImage imageNamed:@"my_button_pressed.png"];
            _imageView.frame = CGRectZero;
            [_buttonView addSubview:_imageView];
            [_buttonView addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}
/*---------------------导航栏右边按钮 上传-----------------------*/
- (void)upload{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认上传所选内容" message:nil preferredStyle:UIAlertControllerStyleAlert];
    //添加默认按钮
    UIAlertAction* defaultBtn = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:defaultBtn];

    //添加取消按钮
    UIAlertAction* cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    }];
    [alert addAction:cancelBtn];
    //显示
    [self presentViewController:alert animated:YES completion:nil];
}


/*--------------------------按钮---------------------------*/
- (void)changeImage:(UIButton *)btn{
    if ([_uploadImageMutableArray[btn.tag] isEqualToString:@"0"]) {
        _uploadImageMutableArray[btn.tag] = @"1";
        btn.alpha = 0.6;
        
    }
    else if ([_uploadImageMutableArray[btn.tag] isEqualToString:@"1"]){
        _uploadImageMutableArray[btn.tag] = @"0";
        btn.alpha = 0.1;
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
