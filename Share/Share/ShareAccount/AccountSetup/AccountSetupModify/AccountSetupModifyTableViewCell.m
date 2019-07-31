//
//  AccountSetupModifyTableViewCell.m
//  Share
//
//  Created by 沈君瑶 on 2019/7/30.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import "AccountSetupModifyTableViewCell.h"

@implementation AccountSetupModifyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _modifyLabel = [[UILabel alloc]init];
    [self.contentView addSubview:_modifyLabel];
    
    _modifyTextField = [[UITextField alloc]init];
    [self.contentView addSubview:_modifyTextField];
    
    return self;
}

- (void)layoutSubviews{
    _modifyLabel.frame = CGRectMake(30, 12, 80, 20);
    
    _modifyTextField.frame = CGRectMake(120, 12, 255, 20);

}

@end
