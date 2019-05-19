//
//  RAFPFiltBaseView.m
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import "RAFPFiltBaseView.h"

@implementation RAFPFiltBaseView

- (void)show {
    [UIView animateWithDuration:0.25 animations:^{
        self.leju_height = self.realHeight;
    }completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.leju_height = 0;
    }completion:^(BOOL finished) {
        
    }];
}

@end
