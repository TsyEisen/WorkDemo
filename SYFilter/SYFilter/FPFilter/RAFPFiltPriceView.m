//
//  RAFPFiltPriceView.m
//  RoomKeeper
//
//  Created by sky on 2019/5/17.
//  Copyright © 2019 leju. All rights reserved.
//

#import "RAFPFiltPriceView.h"
#import "RAFiltItemButton.h"

@interface RAFPFiltPriceView ()
@property(nonatomic, strong)UIButton *conformBtn;
@property(nonatomic, strong)UIView *line;
@property(nonatomic, strong)UIButton *clearBtn;
@end

@implementation RAFPFiltPriceView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    
    [self addSubview:self.clearBtn];
    
    [self.clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.right.equalTo(@-20);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
    
    CGFloat margin = 15;
    CGFloat itemW = (ScreenW - 3*margin - 40)/4;
    CGFloat itemH = 25;
    
    CGFloat y = 20;
    UILabel *titleLabel = [self titleLabelWithTitle:@"起拍价" frame:CGRectMake(20, y, 60, 20)];
    [self addSubview:titleLabel];
    
    y += titleLabel.leju_height + 20;
    
    NSArray *items = [RAFPHouseFiltModel model].price;
    for (int j = 0; j < items.count; j++) {
        NSInteger row = j/4;
        NSInteger col = j%4;
        RAFiltItemButton *btn = [RAFiltItemButton buttonWithModel:items[j]];
        btn.frame = CGRectMake(col * (itemW + margin) + 20 , y + row * (itemH + margin), itemW, itemH);
        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    RAOptionModel *option = [RAOptionModel new];
    option.name = @"自定义";
    RAFiltItemButton *btn = [RAFiltItemButton buttonWithModel:option];
    btn.frame = CGRectMake((items.count%4) * (itemW + margin) + 20 , y + (items.count/4) * (itemH + margin), itemW*2 + margin, itemH);
    [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    y += ((items.count - 1)/4 +1) * (itemH + margin) + 15;
    
    self.realHeight = y + 65;
    
    [self addSubview:self.conformBtn];
    [self addSubview:self.line];
    
    [self.conformBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.height.equalTo(@40);
        make.width.equalTo(@205);
        make.bottom.equalTo(@-13);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.bottom.equalTo(self.conformBtn.mas_top).offset(-13);
        make.height.equalTo(@0.5);
    }];
}

- (void)clearData {
    
}

- (void)itemClick:(RAFiltItemButton *)sender {
    sender.check = !sender.check;
}

- (UILabel *)titleLabelWithTitle:(NSString *)title frame:(CGRect)rect{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor textDarkGrayColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    titleLabel.text = title;
    titleLabel.frame = rect;
    return titleLabel;
}

- (UIButton *)conformBtn {
    if (_conformBtn == nil) {
        _conformBtn = [[UIButton alloc] init];
        [_conformBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_conformBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_conformBtn setBackgroundColor:[UIColor ra_blueColor]];
        _conformBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _conformBtn.layer.cornerRadius = 20;
        _conformBtn.clipsToBounds = YES;
    }
    return _conformBtn;
}

- (UIButton *)clearBtn {
    if (_clearBtn == nil) {
        _clearBtn = [[UIButton alloc] init];
        [_clearBtn setTitle:@"清空条件" forState:UIControlStateNormal];
        [_clearBtn setTitleColor:[UIColor textGrayColor] forState:UIControlStateNormal];
        _clearBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _clearBtn;
}

- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor lineDefaultColor];
    }
    return _line;
}

@end
