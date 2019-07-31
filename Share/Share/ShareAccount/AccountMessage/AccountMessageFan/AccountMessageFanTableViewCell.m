//
//  AccountMessageFanTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageFanTableViewCell.h"

@implementation AccountMessageFanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _leftImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_leftImageView];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel];
    
    _rightImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_rightImageView];
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _leftImageView.frame = CGRectMake(30, 10, 60, 60);
    
    _nameLabel.frame = CGRectMake(100, 30, 200, 20);
    
    _rightImageView.frame = CGRectMake(310, 30, 50, 20);
    
}

@end
