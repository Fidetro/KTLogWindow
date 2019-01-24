//
//  KTLogViewController.m
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import "KTLogViewController.h"

@interface KTLogViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation KTLogViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self masLayoutSubview];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
}
#pragma mark - event response
- (void)printText:(NSString *)text
{
    self.textView.text = [NSString stringWithFormat:@"%@\n%@",self.textView.text,text];
}
- (void)masLayoutSubview
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200)];
    self.textView.editable = NO;
    self.textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.textView];        
}
#pragma mark - private method
#pragma mark - get and set

@end
