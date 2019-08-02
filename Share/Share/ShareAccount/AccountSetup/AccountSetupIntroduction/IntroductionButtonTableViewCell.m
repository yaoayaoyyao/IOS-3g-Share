//
//  IntroductionButtonTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/31.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "IntroductionButtonTableViewCell.h"

@implementation IntroductionButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_nameLabel];
    
    _manButton = [[UIButton alloc]init];
    [self.contentView addSubview:_manButton];
    
    _womanButton = [[UIButton alloc]init];
    [self.contentView addSubview:_womanButton];
    
    return self;
}

- (void)layoutSubviews{
    _nameLabel.text = @"性别";
    _nameLabel.frame = CGRectMake(30, 15, 50, 20);
    
    _manButton.frame = CGRectMake(80, 10, 80, 30);
    [_manButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
    [_manButton setTitle:@"男" forState:UIControlStateNormal];
    [_manButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    _womanButton.frame = CGRectMake(170, 10, 80, 30);
    [_womanButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
    [_womanButton setTitle:@"女" forState:UIControlStateNormal];
    [_womanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
