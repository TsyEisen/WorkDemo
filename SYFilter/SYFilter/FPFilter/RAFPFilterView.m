//
//  RAFPFilterView.m
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import "RAFPFilterView.h"
#import "RAFiltMainButton.h"
#import "RAFPFiltAreaView.h"
#import "RAFPFiltMoreView.h"
#import "RAFPFiltHouseTypeView.h"
#import "RAFPFiltPriceView.h"

#define mainBtnBaseTag 100
#define menuBaseTag 1000
@interface RAFPFilterView ()
@property(nonatomic, strong) NSArray <RAFiltMainButton *>*mainBtns;
@property(nonatomic, strong) RAFiltMainButton *selectBtn;
@property(nonatomic, strong) UIView *line;
@property(nonatomic, strong) UIView *shadow;
@property(nonatomic, strong)RAFPFiltAreaView *blockView;
@property(nonatomic, strong)RAFPFiltMoreView *moreView;
@property(nonatomic, strong)RAFPFiltHouseTypeView *houseTypeView;
@property(nonatomic, strong)RAFPFiltPriceView *priceView;
@end

@implementation RAFPFilterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    __weak typeof(self) weakSelf = self;
    
    NSArray *titles = @[@"区域",@"起拍价",@"户型",@"更多"];
    CGFloat w = self.frame.size.width/titles.count;
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        RAFiltData *data = [RAFiltData modelWithBaseTitle:title];
        data.selectedIndex = 0;
        RAFiltMainButton *btn = [RAFiltMainButton viewFromNib];
        btn.frame = CGRectMake(w*i, 0, w, self.frame.size.height);
        btn.tag = mainBtnBaseTag + i;
        [btn setClickAction:^(NSInteger index) {
            [weakSelf clickFiltButton:index];
        }];
        btn.dataManager = data;
        
        [tempArray addObject:btn];
        [self addSubview:btn];
    }
    self.mainBtns = tempArray;
    
    [self addSubview:self.shadow];
    [self addSubview:self.line];
    
    [self addSubview:self.blockView];
    [self addSubview:self.priceView];
    [self addSubview:self.houseTypeView];
    [self addSubview:self.moreView];
}

- (void)clickFiltButton:(NSInteger)tag {
    
    for (RAFiltMainButton *btn in self.mainBtns) {
        if (btn.tag != tag) {
            btn.selected = NO;
        }else {
            self.selectBtn = btn.selected?btn:nil;
        }
    }
    
    if (self.selectBtn) {
        
        self.shadow.leju_height = ScreenH;
        for (int i = 0; i < 4; i++) {
            RAFPFiltBaseView *menu = [self viewWithTag:i + menuBaseTag];
            if (menu) {
                if (menu.tag - menuBaseTag + mainBtnBaseTag == self.selectBtn.tag) {
                    [self bringSubviewToFront:menu];
                    [menu show];
                }else {
                    [menu dismiss];
                }
            }
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            self.shadow.alpha = 0.3;
        }completion:^(BOOL finished) {
            
        }];
    }else {
        [self dismiss];
        
        for (int i = 0; i < 4; i++) {
            RAFPFiltBaseView *menu = [self viewWithTag:i + menuBaseTag];
            if (menu) {
                [menu dismiss];
            }
        }
    }
}

- (void)dismiss {
    
    [self.blockView dismiss];
    [UIView animateWithDuration:0.25 animations:^{
        self.shadow.alpha = 0;
    }completion:^(BOOL finished) {
        if (self.selectBtn) {
            self.selectBtn.selected = NO;
            self.selectBtn = nil;
        }
        self.shadow.leju_height = 0;
    }];
    
}

- (void)clearData {
    if (self.selectBtn) {
        [self dismiss];
    }
    
    for (RAFiltMainButton *btn in self.mainBtns) {
        [btn clearData];
    }
}


#pragma mark - 懒加载
- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.leju_height - 0.5, self.leju_width, 0.5)];
        _line.backgroundColor = [UIColor lineDefaultColor];
    }
    return _line;
}

- (UIView *)shadow {
    if (_shadow == nil) {
        _shadow = [[UIView alloc] initWithFrame:CGRectMake(0, self.leju_height, self.leju_width, 0)];
        _shadow.backgroundColor = [UIColor blackColor];
        _shadow.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_shadow addGestureRecognizer:tap];
    }
    return _shadow;
}

- (RAFPFiltAreaView *)blockView {
    if (_blockView == nil) {
        _blockView = [[RAFPFiltAreaView alloc] initWithFrame:CGRectMake(0, 50, self.leju_width, 0)];
        _blockView.tag = menuBaseTag;
//        _blockView.completion = self.completion;
        __weak typeof(self) weakSelef = self;
        [_blockView setCompletion:^{
            if (weakSelef.completion) {
                weakSelef.completion();
            }
        }];
    }
    return _blockView;
}

- (RAFPFiltPriceView *)priceView {
    if (_priceView == nil) {
        _priceView = [[RAFPFiltPriceView alloc] initWithFrame:CGRectMake(0, 50, self.leju_width, 0)];
        _priceView.tag = menuBaseTag + 1;
        _priceView.completion = self.completion;
    }
    return _priceView;
}


- (RAFPFiltHouseTypeView *)houseTypeView {
    if (_houseTypeView == nil) {
        _houseTypeView = [[RAFPFiltHouseTypeView alloc] initWithFrame:CGRectMake(0, 50, self.leju_width, 0)];
        _houseTypeView.tag = menuBaseTag + 2;
        _houseTypeView.completion = self.completion;
    }
    return _houseTypeView;
}

- (RAFPFiltMoreView *)moreView {
    if (_moreView == nil) {
        _moreView = [[RAFPFiltMoreView alloc] initWithFrame:CGRectMake(0, 50, self.leju_width, 0)];
        _moreView.tag = menuBaseTag + 3;
        _moreView.completion = self.completion;
    }
    return _moreView;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (CGRectContainsPoint(self.bounds, point)) {
        return YES;
    }else {
        for (UIView *sub in self.subviews) {
            if (CGRectContainsPoint(sub.bounds, point)) {
                return YES;
            }
        }
        return NO;
    }
}

@end
