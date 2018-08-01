//
//  HYResizeTableViewCell.h
//  HYMansonry
//
//  Created by 韩丛旸 on 2018/7/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYListEntity.h"

@class HYResizeTableViewCell;

@protocol HYResizeTableViewCellDelegate <NSObject>

- (void)checkAllInfoDelegate:(HYResizeTableViewCell *)cell;

@end

@interface HYResizeTableViewCell : UITableViewCell

@property (nonatomic, strong) HYListEntity *entity;
@property (nonatomic, weak) id<HYResizeTableViewCellDelegate> delegate;
@property (nonatomic, strong) UILabel *contentLabel;


@end
