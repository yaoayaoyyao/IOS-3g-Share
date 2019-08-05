//
//  MainHolidayViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "MainHolidayViewController.h"
#import "ScanImageNSObject.h"

@interface MainHolidayViewController ()

@property UIScrollView *mainHolidayScrollView;

@end

@implementation MainHolidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
/*--------------------------导航栏---------------------------*/
    UIBarButtonItem *leftImageBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_img"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    //设置颜色
    [leftImageBarButtonItem setTintColor:[UIColor whiteColor]];
    //添加按钮
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObject:leftImageBarButtonItem];
    self.navigationItem.title = @"SHARE" ;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:25], NSForegroundColorAttributeName: [UIColor whiteColor]}] ;
    
    
    _mainHolidayScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_mainHolidayScrollView];
    
    UIImageView *holidayHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 60, 60)];
    holidayHeadImageView.image = [UIImage imageNamed:@"sixin_img1.png"];
    UILabel *holidayThemeLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 20, 100, 30)];
    holidayThemeLabel.text = @"假日";
    holidayThemeLabel.font = [UIFont systemFontOfSize:25];
    UILabel *holidayNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 60, 100, 20)];
    holidayNameLabel.text = @"share小白";
    UILabel *holidayTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(300, 25, 60, 15)];
    holidayTimeLabel.text = @"15分钟前";
    holidayTimeLabel.font = [UIFont systemFontOfSize:12];
    UIImageView *holidayFanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(190, 55, 175, 30)];
    holidayFanImageView.image = [UIImage imageNamed:@"点赞.png"];
    UIImageView *holidayLineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 375, 2)];
    holidayLineImageView.image = [UIImage imageNamed:@"holiday_line.png"];
    
    _mainHolidayScrollView.contentSize = CGSizeMake(375, 1350);
    [_mainHolidayScrollView addSubview:holidayHeadImageView];
    [_mainHolidayScrollView addSubview:holidayThemeLabel];
    [_mainHolidayScrollView addSubview:holidayNameLabel];
    [_mainHolidayScrollView addSubview:holidayTimeLabel];
    [_mainHolidayScrollView addSubview:holidayFanImageView];
    [_mainHolidayScrollView addSubview:holidayLineImageView];
    
    UILabel *holidayContentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 365, 20)];
    holidayContentLabel.text = @"多希望列车能把我带到有你的城市。";
    holidayContentLabel.font = [UIFont systemFontOfSize:15];
    UIImageView *holidayImageView1 = [[UIImageView alloc]initWithFrame: CGRectMake(10, 150, 355, 205)];
    holidayImageView1.image = [UIImage imageNamed:@"works_img1.png"];
    UIImageView *holidayImageView2 = [[UIImageView alloc]initWithFrame: CGRectMake(10, 360, 355, 205)];
    holidayImageView2.image = [UIImage imageNamed:@"works_img2.png"];
    UIImageView *holidayImageView3 = [[UIImageView alloc]initWithFrame: CGRectMake(82, 570, 210, 300)];
    holidayImageView3.image = [UIImage imageNamed:@"works_img3.png"];
    UIImageView *holidayImageView5 = [[UIImageView alloc]initWithFrame: CGRectMake(82, 875, 210, 300)];
    holidayImageView5.image = [UIImage imageNamed:@"works_img5.png"];
    UIImageView *holidayImageView4 = [[UIImageView alloc]initWithFrame: CGRectMake(10, 1180, 355, 205)];
    holidayImageView4.image = [UIImage imageNamed:@"works_img4.png"];
    
    [_mainHolidayScrollView addSubview:holidayContentLabel];
    [_mainHolidayScrollView addSubview:holidayImageView1];
    [_mainHolidayScrollView addSubview:holidayImageView2];
    [_mainHolidayScrollView addSubview:holidayImageView3];
    [_mainHolidayScrollView addSubview:holidayImageView5];
    [_mainHolidayScrollView addSubview:holidayImageView4];
    
    
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scanBigImageClick1:)];
    [holidayImageView1 addGestureRecognizer:tapGestureRecognizer1];
    [holidayImageView1 setUserInteractionEnabled:YES];
    
    
}

/*--------------------------导航栏---------------------------*/
- (void)pressLeft{
    //将当前视图弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated:YES] ;
}


-(void)scanBigImageClick1:(UITapGestureRecognizer *)tap{
    UIImageView *clickedImageView = (UIImageView *)tap.view;
    [ScanImageNSObject scanBigImageWithImageView:clickedImageView];
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
