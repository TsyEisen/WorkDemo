//
//  RPDataDetailCell.m
//  RoomPriceDemo
//
//  Created by 唐绍禹 on 16/10/9.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "RPDataDetailCell.h"
#import "UIColor+SYColor.h"

@implementation RPDataDetailCell

+ (instancetype)cellWithCount:(NSInteger)count andItemW:(CGFloat)itemW {
   
    RPDataDetailCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([RPDataDetailCell class]) owner:self options:nil].lastObject;
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, count * itemW, 0.5)];
    topLine.backgroundColor = [UIColor sy_colorWithRGB:0xddddddd];
    
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5,count * itemW, 0.5)];
    bottomLine.backgroundColor = [UIColor sy_colorWithRGB:0xddddddd];
    
    [cell.contentView addSubview:topLine];
    [cell.contentView addSubview:bottomLine];
    
    for (int i = 0; i < count; i++) {
    
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*itemW, 0, itemW, 50)];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor sy_colorWithRGB:0x666666];
        label.text = @"板 楼";
        [cell.contentView addSubview:label];
       
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(itemW * (i+1)-0.5, 0, 0.5, 50)];
        line.backgroundColor = [UIColor sy_colorWithRGB:0xdddddd];
        [cell.contentView addSubview:line];
    }
    
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
