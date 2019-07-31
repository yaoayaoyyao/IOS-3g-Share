//
//  ShareAccountTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareAccountTableViewCell.h"

@implementation ShareAccountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _userPortraitImageView = [[UIImageView alloc]init];
    [self.contentView addSubview: _userPortraitImageView];
    
    _userNameLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _userNameLabel];
    
    _userJobLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _userJobLabel];
    
    _userSignatureLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _userSignatureLabel];
    
    _userButton1 = [[UIButton alloc]init];
    [self.contentView addSubview: _userButton1];
    
    _userGoodButton = [[UIButton alloc]init];
    [self.contentView addSubview: _userGoodButton];
    
    _userFanButton = [[UIButton alloc]init];
    [self.contentView addSubview: _userFanButton];
    
    return self;
}

- (void)layoutSubviews{
    _userPortraitImageView.image = [UIImage imageNamed:@"works_head.png"];
    _userPortraitImageView.frame = CGRectMake(10, 10, 100, 100);
    
    _userNameLabel.text = @"share小白";
    _userNameLabel.frame = CGRectMake(120, 10, 200, 30);
    
    _userJobLabel.text = @"数媒/设计爱好者";
    _userJobLabel.frame = CGRectMake(120, 40, 200, 15);
    _userJobLabel.font = [UIFont systemFontOfSize:12];
    
    _userSignatureLabel.text = @"开心了就笑，不开心了就过会儿再笑";
    _userSignatureLabel.frame = CGRectMake(120, 65, 255, 30);
    _userSignatureLabel.font = [UIFont systemFontOfSize:15];
    
    [_userButton1 setImage:[UIImage imageNamed:@"img1.png"] forState:UIControlStateNormal];
    [_userButton1 setTitle:@"15" forState:UIControlStateNormal];
    [_userButton1 setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _userButton1.frame = CGRectMake(120, 100, 60, 20);
    
    [_userGoodButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_userGoodButton setTitle:@"120" forState:UIControlStateNormal];
    [_userGoodButton setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _userGoodButton.frame = CGRectMake(180, 100, 60, 20);
    
    [_userFanButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_userFanButton setTitle:@"89" forState:UIControlStateNormal];
    [_userFanButton setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _userFanButton.frame = CGRectMake(245, 100, 60, 20);
}

@end
