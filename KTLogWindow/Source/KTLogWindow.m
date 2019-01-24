//
//  KTLogWindow.m
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import "KTLogWindow.h"
#import "KTLogViewController.h"
@interface KTLogWindow ()

@property (nonatomic, strong) KTLogViewController *logVC;

@end
@implementation KTLogWindow
static KTLogWindow *_window;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _window =  [[super alloc]init];
    });
    return _window;
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _window = [super allocWithZone:zone];
    });
    return _window;
}
- (id)copyWithZone:(NSZone *)zone{
    return _window;
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 300)];
    if (self)
    {
        self.rootViewController = self.logVC;
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

+ (void)printLog:(NSString *)text
{
    [[KTLogWindow shareInstance].logVC printText:text];
}

#pragma mark - get and set
- (KTLogViewController *)logVC
{
    if (!_logVC) {
        _logVC = [[KTLogViewController alloc] init];
    }
    return _logVC;
}

@end
