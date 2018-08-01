//
//  MasonryFDStackViewHeightAdaptiveViewController.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MasonryFDStackViewHeightAdaptiveViewController.h"
#import <FDStackView.h>
#import "HYListEntity.h"
#import "FDStackViewSubView.h"

@interface MasonryFDStackViewHeightAdaptiveViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) FDStackView *stackView;
@property (nonatomic, strong) NSArray<HYListEntity *> *entities;

@end

@implementation MasonryFDStackViewHeightAdaptiveViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _scrollView = ({
        
        UIScrollView *scroll = [[UIScrollView alloc] init];
        [self.view addSubview:scroll];
        scroll.showsVerticalScrollIndicator = NO;
        [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(self.view);
        }];
        scroll;
    });
    
    _stackView = ({
        
        FDStackView *stackView = [[FDStackView alloc] init];
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.spacing = 10;
        [_scrollView addSubview:stackView];
        [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.scrollView);
        }];
        stackView;
        
    });
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    @weakify(self);
    [self buildTestDataThen:^{
        
        @strongify(self);
        for (HYListEntity *entity in self.entities) {
            FDStackViewSubView *subView = [[FDStackViewSubView alloc] init];
            subView.entity = entity;
            [self.stackView addArrangedSubview:subView];
        }
    }];
}

- (void)buildTestDataThen:(void (^)(void))then
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"list"];
        
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[HYListEntity alloc] initWithDictionary:obj]];
        }];
        self.entities = entities;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            !then ?: then();
        });
    });
}

@end
