//
//  HYListEntity.h
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYListEntity : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) BOOL hasFold;
@property (nonatomic, assign) BOOL hasAudioClip;

@end
