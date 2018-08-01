//
//  HYResizeTableViewCell.m
//  HYMansonry
//
//  Created by 韩丛旸 on 2018/7/27.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HYResizeTableViewCell.h"

@interface HYResizeTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *audioBubble;
@property (nonatomic, strong) UIImageView *thumbImageView;
@property (nonatomic, strong) UIButton *checkMoreButton;

@end

@implementation HYResizeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.fd_collapsed = NO;
        _titleLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.right.mas_equalTo(self.contentView);
        }];
        
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 2;
        _contentLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
        [self.contentView addSubview:_contentLabel];
        self.contentLabel.backgroundColor = [UIColor flatGrayColor];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.right.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
        }];
        
        _thumbImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_thumbImageView];
        [_thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.contentLabel.mas_bottom);
            make.left.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(150, 150));
        }];
        _thumbImageView.fd_collapsibleConstraints = self.thumbImageView.constraints;
        _thumbImageView.autoCollapse = YES;
        
        _checkMoreButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _checkMoreButton.backgroundColor = [UIColor flatRedColor];
        [_checkMoreButton setTitle:@"查看更多" forState:(UIControlStateNormal)];
        [_checkMoreButton addTarget:self action:@selector(checkMore:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_checkMoreButton];
        [_checkMoreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.thumbImageView.mas_bottom);
            make.left.bottom.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(100, 44));
        }];
    }
    return self;
    
    
}

- (void)checkMore:(UIButton *)sender {
    
    self.contentLabel.numberOfLines = 0;
    if ([self.delegate respondsToSelector:@selector(checkAllInfoDelegate:)]) {
        [self.delegate checkAllInfoDelegate:self];
    }
}

- (void)setEntity:(HYListEntity *)entity
{
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    if (entity.imageName.length) {
        self.thumbImageView.image = [UIImage imageNamed:entity.imageName];
    } else {
        self.thumbImageView.image = nil;
    }
    
    if (entity.hasFold) {
        self.contentLabel.numberOfLines = 0;
    } else {
        self.contentLabel.numberOfLines = 2;
    }
}

@end
