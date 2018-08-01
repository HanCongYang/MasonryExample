//
//  MasonrySuspendButtonViewController.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MasonrySuspendButtonViewController.h"

@interface MasonrySuspendButtonViewController ()

@property (nonatomic, strong) UIButton *suspendButton;

@end

@implementation MasonrySuspendButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _suspendButton = [[UIButton alloc] init];
    _suspendButton.layer.cornerRadius = 50;
    _suspendButton.backgroundColor = [UIColor flatRedColor];
    [self.navigationController.view addSubview:_suspendButton];
    [_suspendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.mas_greaterThanOrEqualTo(self.navigationController.view);
        make.right.bottom.mas_lessThanOrEqualTo(self.navigationController.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.mas_equalTo(self.navigationController.view).priorityHigh();
        make.top.mas_equalTo(self.navigationController.view).priorityHigh();
    }];
    [_suspendButton addTarget:self action:@selector(suspendButtonClickAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(suspendButtonChangePositon:)];
    [_suspendButton addGestureRecognizer:pan];
}

- (void)suspendButtonClickAction:(UIButton *)sender
{
    NSLog(@"click");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_suspendButton removeFromSuperview];
}

- (void)suspendButtonChangePositon:(UIPanGestureRecognizer *)pan
{
    static CGFloat offsetX = 0;
    static CGFloat offsetY = 0;
    if (pan.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [pan locationInView:self.navigationController.view];
        CGPoint origin = _suspendButton.frame.origin;
        offsetX = point.x - origin.x;
        offsetY = point.y - origin.y;
        NSLog(@"%f, %f", offsetX, offsetY);
    } else {
        CGPoint point = [pan locationInView:self.navigationController.view];
        [_suspendButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.navigationController.view).mas_offset(point.x - offsetX).priorityHigh();
            make.top.mas_equalTo(self.navigationController.view).mas_offset(point.y - offsetY).priorityHigh();
        }];
    }
}

@end
