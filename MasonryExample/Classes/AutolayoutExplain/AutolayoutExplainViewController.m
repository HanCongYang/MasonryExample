//
//  AutolayoutExplainViewController.m
//  MasonryExample
//
//  Created by 李爱红 on 2018/10/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

#import "AutolayoutExplainViewController.h"
#import "AutolayoutView.h"
#import <Masonry.h>

@interface AutolayoutExplainViewController ()

@property (nonatomic, strong) AutolayoutView *v;

@property (nonatomic, strong) NSLayoutConstraint *left;
@property (nonatomic, strong) NSLayoutConstraint *top;
@property (nonatomic, strong) NSLayoutConstraint *right;
@property (nonatomic, strong) NSLayoutConstraint *bottom;


@end

@implementation AutolayoutExplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.v = [[AutolayoutView alloc] init];
    self.v.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.v];
    
    self.v.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.left = [NSLayoutConstraint constraintWithItem:self.v
                                             attribute:(NSLayoutAttributeLeft)
                                             relatedBy:(NSLayoutRelationEqual)
                                                toItem:self.view
                                             attribute:NSLayoutAttributeLeft
                                            multiplier:1
                                              constant:100];
    
    self.top = [NSLayoutConstraint constraintWithItem:self.v
                                             attribute:(NSLayoutAttributeTop)
                                             relatedBy:(NSLayoutRelationEqual)
                                                toItem:self.view
                                             attribute:NSLayoutAttributeTop
                                            multiplier:1
                                              constant:200];
    
    self.right = [NSLayoutConstraint constraintWithItem:self.v
                                             attribute:(NSLayoutAttributeRight)
                                             relatedBy:(NSLayoutRelationEqual)
                                                toItem:self.view
                                             attribute:NSLayoutAttributeRight
                                            multiplier:1
                                              constant:-100];
    
    self.bottom = [NSLayoutConstraint constraintWithItem:self.v
                                             attribute:(NSLayoutAttributeBottom)
                                             relatedBy:(NSLayoutRelationEqual)
                                                toItem:self.view
                                             attribute:NSLayoutAttributeBottom
                                            multiplier:1
                                              constant:-100];
    [self.view addConstraints:@[self.left, self.right, self.bottom, self.top]];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}


@end
