//
//  AccountMessageChatTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageChatTableViewCell.h"

@implementation AccountMessageChatTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _leftImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_leftImageView ];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel ];

    
    _chatLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_chatLabel ];

    
    _timeLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_timeLabel ];
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _leftImageView.frame = CGRectMake(30, 10, 60, 60);
    
    _nameLabel.frame = CGRectMake(100, 15, 100, 20);
    
    _chatLabel.frame = CGRectMake(100, 45, 275, 20);
    _chatLabel.textColor = [UIColor colorWithRed:0.16f green:0.49f blue:0.77f alpha:1.00f];
    _chatLabel.font = [UIFont systemFontOfSize:15];
    
    _timeLabel.frame = CGRectMake(280, 15, 80, 20);
    _timeLabel.textColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.83f alpha:1.00f];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    
}

@end
