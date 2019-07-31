//
//  IntroductionImageTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "IntroductionImageTableViewCell.h"

@implementation IntroductionImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel];
    
    _contentImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_contentImageView];
    
    return self;
}

- (void)layoutSubviews{
    _nameLabel.frame = CGRectMake(30, 50, 50, 20);
    _nameLabel.text = @"头像";
    
    _contentImageView.frame = CGRectMake(80, 10, 100, 100);
    [_contentImageView setImage:[UIImage imageNamed:@"works_head.png"]];
}

@end
