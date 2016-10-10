//
//  RPAreaSetViewController.m
//  RoomPriceDemo
//
//  Created by leju_esf on 16/10/10.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "RPAreaSetViewController.h"
#import "UIColor+SYColor.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define ItemW  (ScreenW - 30)/4
#define ItemH  (ScreenW - 30)/9
#define margin 15

@interface RPAreaSetViewController ()
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSMutableArray *myCareTitles;
@property (nonatomic, strong) NSMutableArray *otherTitles;
@property (nonatomic, strong) NSMutableArray *myCareFrames;
@property (nonatomic, strong) NSMutableArray *otherFrames;
@property (nonatomic, strong) UILabel *myCareLabel;
@property (nonatomic, strong) UILabel *otherLabel;
@property (nonatomic, assign) CGFloat myCareAreaHeight;
@end

@implementation RPAreaSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor sy_colorWithRGB:0xeeeeee];
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    
    [self.view addSubview:self.myCareLabel];
    [self.view addSubview:self.otherLabel];
    
    [self addItems];
}

- (void)addItems {
    [self.myCareFrames removeAllObjects];
    [self.otherFrames removeAllObjects];
    
    for (UIView *sub in self.view.subviews) {
        if (sub.tag > 999) {
            [sub removeFromSuperview];
        }
    }
    
    for (int i = 0; i < self.myCareTitles.count; i++) {
        NSInteger row = i/4;
        NSInteger col = i%4;
        CGFloat x = margin + ItemW * col ;
        CGFloat y = 5 * (row + 1) + ItemH * row + 30;
        CGRect rect = CGRectMake(x, y, ItemW, ItemH);
        [self.myCareFrames addObject:[NSValue valueWithCGRect:rect]];
        RPAreaItem *item = [[RPAreaItem alloc] initWithFrame:rect andTitle:self.myCareTitles[i]];
        __weak typeof(self) weakSelf = self;
        [item setSelectedAction:^(NSInteger tag) {
            [weakSelf refreshUIWithTag:tag];
        }];
        item.tag = 10000 + i;
        item.type = RPAreaItemTypeCare;
        [self.view addSubview:item];
    }
    
    for (int i = 0; i < self.otherTitles.count; i++) {
        NSInteger row = i/4;
        NSInteger col = i%4;
        CGFloat x = margin + ItemW * col ;
        CGFloat y = 5 * (row + 1) + ItemH * row + self.myCareAreaHeight + 45;
        CGRect rect = CGRectMake(x, y, ItemW, ItemH);
        [self.otherFrames addObject:[NSValue valueWithCGRect:rect]];
        RPAreaItem *item = [[RPAreaItem alloc] initWithFrame:rect andTitle:self.otherTitles[i]];
        item.tag = 1000 + i;
        item.type = RPAreaItemTypeOther;
        [self.view addSubview:item];
    }
}

- (void)refreshUIWithTag:(NSInteger)tag {
    RPAreaItem *item = [self.view viewWithTag:tag];
    item.tag = self.otherTitles.count + 1000;
    [self addOtherFrame];
    
    for (UIView *sub in self.view.subviews) {
        if (sub.tag >999 && sub.tag < 10000) {
            //下面的
            NSValue *value = self.otherFrames[sub.tag - 1000];
            [UIView animateWithDuration:0.25 animations:^{
                sub.frame = [value CGRectValue];
            }completion:^(BOOL finished) {
                [self.otherTitles addObject:self.myCareTitles[tag -10000]];
                [self.myCareTitles removeObjectAtIndex:tag - 10000];
                [self addItems];
            }];
        }
        
        if (sub.tag > tag) {
            //上面的
            NSValue *value = self.myCareFrames[sub.tag - 10000 - 1];
            [UIView animateWithDuration:0.25 animations:^{
                sub.frame = [value CGRectValue];
            }];
        }
    }
}

- (void)addOtherFrame {
    if(self.otherFrames.count > 0) {
        NSValue *value = self.otherFrames.lastObject;
        CGFloat x = 0;
        CGFloat y = 0;
        if (self.otherFrames.count%4 == 0) {
            x = 15;
            y = 5 + [value CGRectValue].origin.y + ItemH;
        }else {
            x = [value CGRectValue].origin.x + ItemW;
            y = [value CGRectValue].origin.y;
        }
        NSValue *newValue = [NSValue valueWithCGRect:CGRectMake(x, y, ItemW, ItemH)];
        [self.otherFrames addObject:newValue];
    }else {
        NSValue *newValue = [NSValue valueWithCGRect:CGRectMake(15, self.myCareAreaHeight + 45, ItemW, ItemH)];
        [self.otherFrames addObject:newValue];
    }
    [self.myCareFrames removeLastObject];
}

- (CGFloat)myCareAreaHeight {
    return self.myCareTitles.count > 0 ? (30 + ((self.myCareTitles.count-1)/4 + 1 )* ItemH):30;
}

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"东城",@"西城",@"海淀",@"朝阳",@"丰台",@"门头沟",@"石景山",@"房山",@"通州",@"顺义",@"昌平",@"大兴",@"怀柔",@"平谷",@"延庆",@"密云"];
    }
    return _titles;
}

- (NSMutableArray *)myCareTitles {
    if (_myCareTitles == nil) {
        _myCareTitles = [NSMutableArray arrayWithArray:@[@"东城",@"西城",@"海淀",@"朝阳",@"丰台",@"门头沟"]];
    }
    return _myCareTitles;
}

- (NSMutableArray *)otherTitles {
    if (_otherTitles == nil) {
        _otherTitles = [NSMutableArray arrayWithArray:@[@"石景山",@"房山",@"通州",@"顺义",@"昌平",@"大兴",@"怀柔",@"平谷",@"延庆",@"密云"]];
    }
    return _otherTitles;
}

- (NSMutableArray *)otherFrames {
    if (_otherFrames == nil) {
        _otherFrames = [NSMutableArray array];
    }
    return _otherFrames;
}

- (NSMutableArray *)myCareFrames {
    if (_myCareFrames == nil) {
        _myCareFrames = [NSMutableArray array];
    }
    return _myCareFrames;
}

- (UILabel *)myCareLabel {
    if (_myCareLabel == nil) {
        _myCareLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 15)];
        _myCareLabel.textColor = [UIColor sy_colorWithRGB:0x999999];
        _myCareLabel.font = [UIFont systemFontOfSize:13];
        _myCareLabel.text = @"我关注的区域";
    }
    return _myCareLabel;
}

- (UILabel *)otherLabel {
    if (_otherLabel== nil) {
        _otherLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.myCareAreaHeight + 30, 100, 15)];
        _otherLabel.textColor = [UIColor sy_colorWithRGB:0x999999];
        _otherLabel.font = [UIFont systemFontOfSize:13];
        _otherLabel.text = @"其他区域";
    }
    return _otherLabel;
}

@end

@interface RPAreaItem ()
@property (nonatomic, strong) UIButton *selectedBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation RPAreaItem

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.selectedBtn];
        self.titleLabel.text = title;
    }
    return self;
}

- (void)setType:(RPAreaItemType)type {
    _type = type;
    [self.selectedBtn setBackgroundImage:[UIImage imageNamed:type == RPAreaItemTypeCare ? @"compare_reduce":@"compare_insert"] forState:UIControlStateNormal];
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, self.frame.size.width - 9, self.frame.size.height - 9)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor sy_colorWithRGB:0x333333];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.layer.borderColor = [UIColor sy_colorWithRGB:0xdddddd].CGColor;
        _titleLabel.layer.borderWidth = 0.5;
        _titleLabel.layer.cornerRadius = 3;
        _titleLabel.clipsToBounds = YES;
    }
    return _titleLabel;
}

- (void)selectedBtnClick {
    if (self.selectedAction) {
        __weak typeof(self) weakSelf = self;
        self.selectedAction(weakSelf.tag);
    }
}

- (UIButton *)selectedBtn {
    if (_selectedBtn == nil) {
        _selectedBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 21, 0, 18, 18)];
        [_selectedBtn addTarget:self action:@selector(selectedBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedBtn;
}

@end
