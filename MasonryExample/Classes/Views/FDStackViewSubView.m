//
//  FDStackViewSubView.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "FDStackViewSubView.h"

@interface FDStackViewSubView ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIView *audioBubble;
@property (nonatomic, strong) UIImageView *thumbImageView;

@end

@implementation FDStackViewSubView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        _titleLabel = ({
            
            UILabel *label = [[UILabel alloc] init];
            label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
            label.textColor = [UIColor blackColor];
            label.font = [UIFont boldSystemFontOfSize:20];
            [_contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.mas_equalTo(self.contentView).mas_offset(8);
                make.left.mas_equalTo(self.contentView).mas_offset(20);
                make.right.mas_equalTo(self.contentView).mas_offset(-20);
            }];
            label;
        });
        
        _contentLabel = ({
            
            UILabel *label = [[UILabel alloc] init];
            label.numberOfLines = 0;
            label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
            label.textColor = [UIColor lightGrayColor];
            label.font = [UIFont systemFontOfSize:15];
            [_contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(8);
                make.left.mas_equalTo(self.contentView).mas_offset(20);
                make.right.mas_equalTo(self.contentView).mas_offset(-20);
            }];
            label;
        });
        
        _audioBubble = ({
            
            UIView *bubble = [[UIView alloc] init];
            bubble.backgroundColor = [UIColor lightGrayColor];
            bubble.layer.cornerRadius = 5;
            [_contentView addSubview:bubble];
            [bubble mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.size.mas_equalTo(CGSizeMake(150, 44));
                make.left.mas_equalTo(self.contentView).mas_offset(20);
                make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(8);
            }];
            
            UILabel *time = [[UILabel alloc] init];
            time.text = @"5\"";
            time.textColor = [UIColor blackColor];
            [bubble addSubview:time];
            [time mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.left.mas_equalTo(bubble).mas_offset(20);
                make.top.bottom.right.mas_equalTo(bubble);
            }];
            
            bubble;
        });
        _audioBubble.fd_collapsibleConstraints = self.audioBubble.constraints;
        
        
        _thumbImageView = ({
            
            UIImageView *thumbImageView = [[UIImageView alloc] init];
            thumbImageView.layer.cornerRadius = 3;
            thumbImageView.layer.masksToBounds = YES;
            [_contentView addSubview:thumbImageView];
            [thumbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.top.mas_equalTo(self.audioBubble.mas_bottom).mas_offset(8);
                make.left.mas_equalTo(self.contentView).mas_offset(20);
                make.size.mas_equalTo(CGSizeMake(150, 150));
            }];
            thumbImageView;
        });
        self.thumbImageView.fd_collapsibleConstraints = self.thumbImageView.constraints;
        self.thumbImageView.autoCollapse = YES;
        
        {
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = [UIColor lightGrayColor];
            [_contentView addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.contentView).mas_offset(20);
                make.bottom.right.mas_equalTo(self.contentView);
                make.height.mas_equalTo(0.5);
            }];
        }
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.thumbImageView.mas_bottom).mas_offset(8);
            make.edges.mas_equalTo(self);
            make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
        }];
        
        [self.contentView setContentHuggingPriority:(UILayoutPriorityRequired) forAxis:(UILayoutConstraintAxisVertical)];
        
        
    }
    return self;
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
    NSLog(@"%@", !entity.hasAudioClip ? @"YES" : @"NO");
    self.audioBubble.fd_collapsed = !entity.hasAudioClip;
}

@end
