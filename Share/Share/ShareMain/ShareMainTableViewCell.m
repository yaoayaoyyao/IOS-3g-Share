//
//  ShareMainTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareMainTableViewCell.h"

@implementation ShareMainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _LeftImageView = [[UIImageView alloc]init];
    [self.contentView addSubview: _LeftImageView];
    
    _NameLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _NameLabel];
    
    _TypeLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _TypeLabel];
    
    _TimeLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _TimeLabel];
    
    _GoodButton = [[UIButton alloc]init];
    [self.contentView addSubview: _GoodButton];
    
    _FanButton = [[UIButton alloc]init];
    [self.contentView addSubview: _FanButton];
    
    _ShareButton = [[UIButton alloc]init];
    [self.contentView addSubview: _ShareButton];
    
    return self;
}

- (void)layoutSubviews{
    _LeftImageView.frame = CGRectMake(0, 0, 130, 110);
    
    _NameLabel.frame = CGRectMake(150, 5, 225, 38);
    _NameLabel.numberOfLines = 0;
    _NameLabel.textAlignment = NSTextAlignmentLeft;
    _NameLabel.font = [UIFont systemFontOfSize:15];
    
    _TypeLabel.frame = CGRectMake(150, 48, 225, 15);
    _TypeLabel.font = [UIFont systemFontOfSize: 12];
    _TypeLabel.textColor = [UIColor grayColor];
    
    _TimeLabel.frame = CGRectMake(150, 68, 225, 15);
    _TimeLabel.font = [UIFont systemFontOfSize:12];
    _TimeLabel.textColor = [UIColor grayColor];
    
    
//    [_GoodButton setImage:[UIImage imageNamed:@"button_zan.png"] forState:UIControlStateNormal];
    [_GoodButton setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _GoodButton.frame = CGRectMake(150, 88, 70, 20);
    
    [_FanButton setImage:[UIImage imageNamed:@"button_guanzhu.png"] forState:UIControlStateNormal];
    [_FanButton setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _FanButton.frame = CGRectMake(220, 88, 70, 20);
    
    [_ShareButton setImage:[UIImage imageNamed:@"button_share.png"] forState:UIControlStateNormal];
    [_ShareButton setTitle:@"20" forState:UIControlStateNormal];
    [_ShareButton setTitleColor:[UIColor colorWithRed:0.44f green:0.69f blue:0.85f alpha:1.00f] forState:UIControlStateNormal];
    _ShareButton.frame = CGRectMake(290, 88, 70, 20);
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}


@end
