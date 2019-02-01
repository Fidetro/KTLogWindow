//
//  KTLogViewController.h
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTLogViewController : UIViewController


@property (nonatomic, copy) void(^layoutToFrame_block)(CGRect rect);

- (void)printText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
