//
//  RAFiltBlockCell.m
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import "RAFiltBlockCell.h"

@implementation RAFiltBlockCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setCheck:(BOOL )check {
    _check = check;
    if (check) {
        self.nameLabel.textColor = [UIColor ra_blueColor];
    }else {
        self.nameLabel.textColor = [UIColor textGrayColor];
    }
}


@end
