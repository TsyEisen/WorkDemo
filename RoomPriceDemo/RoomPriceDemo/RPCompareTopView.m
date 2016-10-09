//
//  RPCompareTopView.m
//  RoomPriceDemo
//
//  Created by leju_esf on 16/10/9.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "RPCompareTopView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface RPCompareTopView ()
@property (nonatomic, strong) NSArray *villages;
@end

@implementation RPCompareTopView

- (instancetype)initWithFrame:(CGRect)frame andVillages:(NSArray *)villages {
    if (self = [super initWithFrame:frame]) {
        self.villages = villages;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    CGFloat marginX = 15;
    CGFloat marginY = 10.0;
    CGFloat itemW = (self.frame.size.width - (self.villages.count + 1)*marginX)/self.villages.count;
    CGFloat itemH = (100 - 2*marginY);
    for (int i = 0; i < self.villages.count; i++) {
        CGFloat x = marginX *(i + 1) + itemW * i;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, marginY, itemW, itemH)];
        imageView.backgroundColor = [UIColor purpleColor];
        [self addSubview:imageView];
    }
}

@end
