//
//  ShareAccountTableViewCell2.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareAccountTableViewCell2.h"

@implementation ShareAccountTableViewCell2

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

- (void)layoutSubviews{
    
    [super layoutSubviews];
    _leftImageView.frame = CGRectMake(25, 12, 20, 20);
    
    _nameLabel.frame = CGRectMake(50, 12, 270, 20);
    
    _rightImageView.frame = CGRectMake(330, 12, 20, 20);
    _rightImageView.image = [UIImage imageNamed:@"img3.png"];
}

@end
