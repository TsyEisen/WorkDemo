//
//  RAFiltItemButton.m
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import "RAFiltItemButton.h"

@implementation RAFiltItemButton

//- (instancetype)init {
//    if (self = [super init]) {
//        [self setTitleColor:[UIColor textGrayColor] forState:UIControlStateNormal];
//        self.backgroundColor = [UIColor whiteColor];
//        self.layer.borderColor = [UIColor colorWithRGB:0xd9d9d9].CGColor;
//        self.layer.borderWidth = 0.5;
//        self.layer.cornerRadius = 2;
//        self.titleLabel.font = [UIFont systemFontOfSize:12];
//    }
//    return self;
//}

+ (instancetype)buttonWithModel:(RAOptionModel *)model{
    RAFiltItemButton *button = [RAFiltItemButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor textGrayColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderColor = [UIColor colorWithRGB:0xd9d9d9].CGColor;
    button.layer.borderWidth = 0.5;
    button.layer.cornerRadius = 2;
    button.model = model;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    return button;
}

- (void)setCheck:(BOOL)check {
    _check = check;
    if (check) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor colorWithRGB:0x2174FE];
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.borderWidth = 0;
    }else {
        [self setTitleColor:[UIColor textGrayColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor colorWithRGB:0xd9d9d9].CGColor;
        self.layer.borderWidth = 0.5;
    }
}

- (void)setModel:(RAOptionModel *)model {
    _model = model;
    [self setTitle:model.name forState:UIControlStateNormal];
}

@end
