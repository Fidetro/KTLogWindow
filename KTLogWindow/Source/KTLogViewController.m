//
//  KTLogViewController.m
//  KTLogWindow
//
//  Created by Fidetro on 2019/1/24.
//  Copyright © 2019 karim. All rights reserved.
//

#import "KTLogViewController.h"
#import "Masonry.h"
#define kNormalFrame CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 300)
#define kCloseFrame CGRectMake([[UIScreen mainScreen] bounds].size.width-40, 0, 40, 30)
@interface KTLogViewController ()
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *bottomButton;
@property (nonatomic, strong) UIButton *pasteButton;
@end

@implementation KTLogViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self masLayoutSubview];
    self.view.backgroundColor = [UIColor clearColor];
}
#pragma mark - event response
- (void)printText:(NSString *)text
{
    self.textView.text = [NSString stringWithFormat:@"%@\n%@",self.textView.text,text];
}

- (void)closeAction:(UIButton *)sender
{
    CGRect frame;
    BOOL hidden = NO;
    if (sender.selected) {
        self.bottomButton.hidden = hidden;
        self.pasteButton.hidden = hidden;
        frame = kNormalFrame;
        self.textView.frame = frame;
    }else{
        hidden = YES;
        self.bottomButton.hidden = hidden;
        self.pasteButton.hidden = hidden;
        frame = kCloseFrame;
        self.textView.frame = frame;
    }
    sender.selected = !sender.selected;
    if (self.layoutToFrame_block)
    {
        self.layoutToFrame_block(frame);
    }
}

- (void)pasteTextAction:(UIButton *)sender
{
    [UIPasteboard generalPasteboard].string = self.textView.text;
}

- (void)scrollToBottomAction:(UIButton *)sender
{
    CGFloat textViewHeight =  kNormalFrame.size.height;
    [self.textView setContentOffset:CGPointMake(0, self.textView.contentSize.height-textViewHeight) animated:YES];
}

- (void)masLayoutSubview
{
    self.textView = [[UITextView alloc] init];
    self.textView.editable = NO;
    self.textView.layoutManager.allowsNonContiguousLayout = NO;
    self.textView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.left.right.mas_equalTo(self.view);
    }];
    self.pasteButton = [[UIButton alloc] init];
    [self.pasteButton setTitle:@"复制" forState:UIControlStateNormal];
    [self.pasteButton addTarget:self action:@selector(pasteTextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pasteButton];
    [self.pasteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.left.mas_equalTo(self.view.mas_left);
    }];
    self.bottomButton = [[UIButton alloc] init];
    [self.bottomButton setTitle:@"底部" forState:UIControlStateNormal];
    [self.bottomButton addTarget:self action:@selector(scrollToBottomAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bottomButton];
    [self.bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.right.mas_equalTo(self.view.mas_right);
    }];
    
    self.closeButton = [[UIButton alloc] init];
    [self.closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [self.closeButton setTitle:@"展开" forState:UIControlStateSelected];
    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeButton];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.right.mas_equalTo(self.view.mas_right);
    }];
 
}
#pragma mark - private method
#pragma mark - get and set

@end
