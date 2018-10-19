//
//  MasonrySpringAnimationViewController.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MasonrySpringAnimationViewController.h"

@interface MasonrySpringAnimationViewController ()

@end

@implementation MasonrySpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *redView = [[UIView alloc] init];
    redView.layer.cornerRadius = 5;
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(200, 200));
        make.center.mas_equalTo(self.view);
    }];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"6666666";
    label.backgroundColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentCenter;
    [redView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(redView);
//        make.edges.mas_equalTo(redView).mas_offset(UIEdgeInsetsMake(30, 30, 30, 30));
    }];
    [redView layoutIfNeeded];
    
    [self.view layoutIfNeeded];
    
    [redView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(300, 300));
        make.center.mas_equalTo(self.view);
    }];
    


//    [self.view setNeedsUpdateConstraints];
//    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:1.0
                          delay:1.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [self.view layoutIfNeeded];
                         [redView layoutIfNeeded];
                     }
                     completion:nil];

}

@end
