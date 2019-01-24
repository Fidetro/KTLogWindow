//
//  KTLogWindow.h
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KTLogWindow : UIWindow

+ (instancetype)shareInstance;

+ (void)printLog:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
