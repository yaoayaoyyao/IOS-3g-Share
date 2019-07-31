//
//  ShareActivityTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "ShareActivityTableViewCell.h"

@implementation ShareActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.activityButton = [[UIButton alloc]init];
    [self.contentView addSubview:_activityButton];
    
    self.activitylabel = [[UILabel alloc]init];
    [self.contentView addSubview:_activitylabel];
    
    return self;
}

- (void)layoutSubviews{
    _activityButton.frame = CGRectMake(0, 0, 355, 179);
    _activityButton.layer.borderColor = [[UIColor grayColor] CGColor];
    _activityButton.layer.borderWidth = 0.2;
    
    _activitylabel.frame = CGRectMake(0, 179, 355, 30);
    _activitylabel.font = [UIFont systemFontOfSize:15];
    _activitylabel.backgroundColor = [UIColor whiteColor];
    _activitylabel.layer.borderColor = [[UIColor grayColor] CGColor];
    _activitylabel.layer.borderWidth = 0.2;
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x += 10;
    frame.size.width -= 20;
    [super setFrame:frame];
}

@end
