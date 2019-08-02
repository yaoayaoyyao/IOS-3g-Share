//
//  SearchUploadImageViewController.h
//  Share
//
//  Created by 沈君瑶 on 2019/8/1.
//  Copyright © 2019 沈君瑶. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ReturnTextBlock)(NSString *name, NSString *numble);
@interface SearchUploadImageViewController : UIViewController

@property NSString *nameOfImage;
@property NSString *numbleOfImage;
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

@end

NS_ASSUME_NONNULL_END
