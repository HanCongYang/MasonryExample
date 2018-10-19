//
//  ViewController.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "ViewController.h"

@interface TBModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *viewControllerClassName;

@end

@implementation TBModel

@end

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<TBModel *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    _dataSource = @[].mutableCopy;
    [_dataSource addObject:[self tableViewCellTitle:@"Spring动画" viewClassName:@"MasonrySpringAnimationViewController"]];
    [_dataSource addObject:[self tableViewCellTitle:@"悬浮按钮" viewClassName:@"MasonrySuspendButtonViewController"]];
    [_dataSource addObject:[self tableViewCellTitle:@"高度自适应Cell" viewClassName:@"MasonryTableViewCellHeightAdaptiveViewController"]];
    [_dataSource addObject:[self tableViewCellTitle:@"FDStackView自适应" viewClassName:@"MasonryFDStackViewHeightAdaptiveViewController"]];
    [_dataSource addObject:[self tableViewCellTitle:@"Autolayout详解" viewClassName:@"AutolayoutExplainViewController"]];
    [_dataSource addObject:[self tableViewCellTitle:@"Autolayout详解" viewClassName:@"MasonryLeadingViewController"]];


    
}

#pragma mark - > UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.dataSource[indexPath.row].title;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *vc = [[NSClassFromString(self.dataSource[indexPath.row].viewControllerClassName) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (TBModel *)tableViewCellTitle:(NSString *)cellTitle viewClassName:(NSString *)className
{
    TBModel *model = [[TBModel alloc] init];
    model.title = cellTitle;
    model.viewControllerClassName = className;
    return model;
}

@end
