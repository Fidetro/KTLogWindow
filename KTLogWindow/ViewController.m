//
//  ViewController.m
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import "ViewController.h"
#import "KTLogWindow.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KTLogWindow *window = [KTLogWindow shareInstance];
    window.hidden = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [KTLogWindow printLog:@"1"];
//    NSLog(@"%@",[[UIApplication sharedApplication] windows]);
}

@end
