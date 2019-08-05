//
//  ShareBeginViewController.m
//  Share
//
//  Created by 沈君瑶 on 2019/8/4.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareBeginViewController.h"
#import "ShareLogin.h"

@interface ShareBeginViewController ()

@end

@implementation ShareBeginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *backGround = [UIImage imageNamed:@"login_1.jpg"];
    self.view.layer.contents = (id) backGround.CGImage;    // 如果需要背景透明加上下面这句
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //延迟2s调用，一般启动页面会停留，或者有些动画什么的，本例只简述思路，不深究细节
    [self performSelector:@selector(changeView) withObject:self afterDelay:1];
}

- (void)changeView {
    UIWindow *window = self.view.window;
    ShareLogin *shareLogin = [[ShareLogin alloc] init];
    
    //添加一个缩放效果
    shareLogin.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.1 animations:^{
        shareLogin.view.transform = CGAffineTransformIdentity;
    }];
    
    window.rootViewController = shareLogin;
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
