//
//  MasonryTableViewCellHeightAdaptiveViewController.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "MasonryTableViewCellHeightAdaptiveViewController.h"
#import "HYResizeTableViewCell.h"
#import "HYListEntity.h"

@interface MasonryTableViewCellHeightAdaptiveViewController ()<UITableViewDelegate, UITableViewDataSource, HYResizeTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<HYListEntity *> *entities;

@end

@implementation MasonryTableViewCellHeightAdaptiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [_tableView registerClass:[HYResizeTableViewCell class]
      forCellReuseIdentifier:@"cell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    @weakify(self);
    [self buildTestDataThen:^{
        
        @strongify(self);
        [self.tableView reloadData];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.entities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYResizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.entity = self.entities[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark - > HYResizeTableViewCellDelegate

- (void)checkAllInfoDelegate:(HYResizeTableViewCell *)cell {
    
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    HYListEntity *entity = self.entities[indexPath.row];
    entity.hasFold = !entity.hasFold;
    
    BOOL needAdjustPosition = NO;
    CGRect cellFrameToView = [cell convertRect:cell.bounds toView:self.view];
    if (cellFrameToView.origin.y <= 0) {
        needAdjustPosition = YES;
    }
    
    
    [UIView performWithoutAnimation:^{
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    }];
    
    if (needAdjustPosition) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CGPoint offset = CGPointZero;
            CGRect cellFrameToView = [cell convertRect:cell.bounds toView:self.view];
            offset = self.tableView.contentOffset;
            offset.y += cellFrameToView.origin.y;
            self.tableView.contentOffset = offset;
        });
    }
}

@end
