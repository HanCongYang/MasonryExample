//
//  MasonryLeadingViewController.m
//  MasonryExample
//
//  Created by 李爱红 on 2018/10/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

#import "MasonryLeadingViewController.h"
#import <Masonry.h>

@interface MasonryLeadingViewController ()

@end

@implementation MasonryLeadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self.view).mas_offset(44);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    UILabel *label2 = [[UILabel alloc] init];
    label2.backgroundColor = [UIColor redColor];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).mas_offset(44);
        make.leading.mas_equalTo(label);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.font = [UIFont systemFontOfSize:20];
    label3.text = @"a\naa\naaaa";
    label3.numberOfLines = 0;
    label3.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label2.mas_bottom).mas_offset(44);
        make.leading.mas_equalTo(label2);
//        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];

    UILabel *label4 = [[UILabel alloc] init];
    label4.font = [UIFont systemFontOfSize:30];
    label4.text = @"bbbbbbbbb";
    label4.numberOfLines = 0;
    label4.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(label3.mas_right).mas_offset(44);
//        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    NSLayoutConstraint *baseline = [NSLayoutConstraint constraintWithItem:label4
                                                                attribute:(NSLayoutAttributeFirstBaseline)
                                                                relatedBy:(NSLayoutRelationEqual)
                                                                   toItem:label3
                                                                attribute:(NSLayoutAttributeFirstBaseline)
                                                               multiplier:1
                                                                 constant:0];
    [self.view addConstraint:baseline];
    [label3 sizeToFit];
    [label2 sizeToFit];
}


@end
