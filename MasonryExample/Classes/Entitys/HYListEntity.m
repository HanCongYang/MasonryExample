//
//  HYListEntity.m
//  MasonryExample
//
//  Created by 韩丛旸 on 2018/8/1.
//  Copyright © 2018年 HCY. All rights reserved.
//

#import "HYListEntity.h"

@implementation HYListEntity

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        self.title = dictionary[@"title"];
        self.content = dictionary[@"content"];
        self.imageName = dictionary[@"imageName"];
        self.hasAudioClip = [dictionary[@"audio"] boolValue];
    }
    return self;
}

@end
