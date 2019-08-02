//
//  AccountSetupMessageTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupMessageTableViewCell.h"

@implementation AccountSetupMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _messageLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_messageLabel];
    
    _messageButton = [[UIButton alloc]init];
    [self.contentView addSubview:_messageButton];
    
    return self;
}

- (void)layoutSubviews{
    _messageLabel.frame = CGRectMake(50, 20, 270, 20);
    
    _messageButton.frame = CGRectMake(330, 20, 20, 20);
    [_messageButton setImage:[UIImage imageNamed:@"my_button_normal.png"] forState:UIControlStateNormal];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 1));
}

@end
