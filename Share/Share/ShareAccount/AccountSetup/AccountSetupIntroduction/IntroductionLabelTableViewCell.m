//
//  IntroductionLabelTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "IntroductionLabelTableViewCell.h"

@implementation IntroductionLabelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel];
    
    _contentLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_contentLabel];
    
    return  self;
}

- (void)layoutSubviews{
    _nameLabel.frame = CGRectMake(30, 12, 50, 20);
    
    _contentLabel.frame = CGRectMake(80, 12, 295, 20);
}

@end
