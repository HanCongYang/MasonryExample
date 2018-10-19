//
//  AutolayoutView.m
//  MasonryExample
//
//  Created by 李爱红 on 2018/10/19.
//  Copyright © 2018年 LAH. All rights reserved.
//

#import "AutolayoutView.h"
#import "AutolayoutSubview.h"

@implementation AutolayoutView

- (instancetype)init {
    self = [super init];
    if (self) {

        AutolayoutSubview *subview = [[AutolayoutSubview alloc] init];

        subview.backgroundColor = [UIColor redColor];
        subview.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:subview];
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:subview
                                                 attribute:(NSLayoutAttributeLeft)
                                                 relatedBy:(NSLayoutRelationEqual)
                                                    toItem:self
                                                 attribute:NSLayoutAttributeLeft
                                                multiplier:1
                                                  constant:20];
        
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:subview
                                                attribute:(NSLayoutAttributeTop)
                                                relatedBy:(NSLayoutRelationEqual)
                                                   toItem:self
                                                attribute:NSLayoutAttributeTop
                                               multiplier:1
                                                 constant:20];
        
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:subview
                                                  attribute:(NSLayoutAttributeRight)
                                                  relatedBy:(NSLayoutRelationEqual)
                                                     toItem:self
                                                  attribute:NSLayoutAttributeRight
                                                 multiplier:1
                                                   constant:-20];
        
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:subview
                                                   attribute:(NSLayoutAttributeBottom)
                                                   relatedBy:(NSLayoutRelationEqual)
                                                      toItem:self
                                                   attribute:NSLayoutAttributeBottom
                                                  multiplier:1
                                                    constant:-20];
        [self addConstraints:@[left, right, bottom, top]];
        

    }
    return self;
}


// Update step
- (void)updateConstraints {
    [super updateConstraints];
    
}

// Layout step
- (void)layoutSubviews {
    [super layoutSubviews];
//    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forkingdog"]];
//    image.backgroundColor = [UIColor blueColor];
//    [self addSubview:image];
//    image.contentMode = UIViewContentModeScaleToFill;
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
}

// Rendering
/*
 This step is responsible for bringing pixels onto the screen. By default, UIView passes all the work to a backing CALayer that contains a pixel bitmap of the current view state. This step is independent of whether Auto Layout is enabled for a view or not.
 The key method here is drawRect. Unless you are doing custom OpenGL ES, Core Graphicsor UIKit drawing, there is no need to override this method.
 All changes like background color, adding subviews etc. are drawn automatically. Most of the time you can compose UI from different views and layersб and don’t need to override drawRect.
 这一步就是将view将展示的内容绘制到屏幕上，
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

}

- (CGSize)intrinsicContentSize {
    return [super intrinsicContentSize];
}

- (CGRect)alignmentRectForFrame:(CGRect)frame {
    return [super alignmentRectForFrame:frame];
}

- (UIEdgeInsets)alignmentRectInsets {
    return UIEdgeInsetsMake(0, -15, -15, 0);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (NSLayoutConstraint *c in self.superview.constraints) {
        if (c.firstAttribute == NSLayoutAttributeBottom) {
            c.active = NO;
            NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.superview
                                                                      attribute:(NSLayoutAttributeBottom)
                                                                      relatedBy:(NSLayoutRelationEqual)
                                                                         toItem:self
                                                                      attribute:NSLayoutAttributeBottom
                                                                     multiplier:1
                                                                       constant:200];
            [self.superview addConstraint:bottom];
            [UIView animateWithDuration:5 animations:^{
                [self.superview layoutIfNeeded];
            }];

        }
    }
//    [self setNeedsUpdateConstraints];
    
}
@end
