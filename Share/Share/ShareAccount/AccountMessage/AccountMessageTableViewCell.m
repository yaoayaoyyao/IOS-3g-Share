//
//  AccountMessageTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountMessageTableViewCell.h"

@implementation AccountMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel];
    
    _rightImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_rightImageView];
    
    _numbleLabel = [[UILabel alloc]init];
    [self.contentView addSubview: _numbleLabel];
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    _nameLabel.frame = CGRectMake(50, 12, 270, 20);
    
    _rightImageView.frame = CGRectMake(280, 12, 20, 20);
    _rightImageView.image = [UIImage imageNamed:@"img3.png"];
    
    _numbleLabel.frame = CGRectMake(310, 12, 20, 20);
    _numbleLabel.textColor = [UIColor colorWithRed:0.20f green:0.53f blue:0.78f alpha:1.00f];
}

@end
