//
//  ShareSighUp.h
//  Share
//
//  Created by 沈君瑶 on 2019/7/29.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ShareSighUpDelegate <NSObject>
- (void)Name:(NSString *)name andPassword:(NSString *)password;

@end

@interface ShareSighUp : UIViewController
@property (nonatomic, weak)id<ShareSighUpDelegate>sighUpDelegate;

@end

NS_ASSUME_NONNULL_END
