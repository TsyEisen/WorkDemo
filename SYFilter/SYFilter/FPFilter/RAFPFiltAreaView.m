//
//  RAFPFiltAreaView.m
//  RoomKeeper
//
//  Created by sky on 2019/5/17.
//  Copyright © 2019 leju. All rights reserved.
//

#import "RAFPFiltAreaView.h"
#import "UIColor+TAToolkit.h"
#import "RAFPHouseFiltModel.h"
#import "RAFiltBlockCell.h"
@interface RAFPFiltAreaView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableOne;
@property (nonatomic, strong) UITableView *tableTwo;
@property (nonatomic, strong) UITableView *tableThree;
@property (nonatomic, assign) NSInteger selected0;
@property (nonatomic, assign) NSInteger selected1;
@property (nonatomic, assign) NSInteger selected2;
@property (nonatomic, strong) NSArray *firstTableTitles;
@end

@implementation RAFPFiltAreaView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setUpUI {
    
    self.realHeight = 400;
    
    [self addSubview:self.tableOne];
    [self addSubview:self.tableTwo];
    [self addSubview:self.tableThree];
    
    [self.tableOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(@0);
        make.width.equalTo(@(ScreenW * 0.5));
    }];
    [self.tableTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.left.equalTo(self.tableOne.mas_right);
        make.width.equalTo(@(ScreenW * 0.5));
    }];
    [self.tableThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(@0);
        make.left.equalTo(self.tableTwo.mas_right);
        make.width.equalTo(@(0));
    }];
    
    [self.tableOne rk_registerNibWithClass:[RAFiltBlockCell class]];
    [self.tableTwo rk_registerNibWithClass:[RAFiltBlockCell class]];
    [self.tableThree rk_registerNibWithClass:[RAFiltBlockCell class]];
}

- (void)clearData {
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableOne ) {
        return self.firstTableTitles.count;
    }else if (tableView == self.tableTwo) {
        if (self.selected0 == 0) {
            return self.areaDatas.count;
        }else {
            return self.subwayDatas.count;
        }
    }else {
        if (self.selected0 == 0) {
            RAOptionModel *model = self.areaDatas[self.selected1];
            return model.data.block.count;
        }else {
            RAOptionModel *model = self.subwayDatas[self.selected1];
            return model.data.block.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RAFiltBlockCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RAFiltBlockCell class])];
    if (tableView == self.tableOne ) {
        cell.nameLabel.text = self.firstTableTitles[indexPath.row];
        cell.check = self.selected0 == indexPath.row;
    }else if (tableView == self.tableTwo) {
        if (self.selected0 == 0) {
            RAOptionModel *model = self.areaDatas[indexPath.row];
            cell.nameLabel.text = model.name;
            cell.check = self.selected1 == indexPath.row;
        }else {
            RAOptionModel *model = self.subwayDatas[indexPath.row];
            cell.nameLabel.text = model.name;
            cell.check = self.selected1 == indexPath.row;
        }
    }else {
        if (self.selected0 == 0) {
            RAOptionModel *model = self.areaDatas[self.selected1];
            RAOptionModel *item = model.data.block[indexPath.row];
            cell.nameLabel.text = item.name;
            cell.check = self.selected2 == indexPath.row;
            
        }else {
            
            RAOptionModel *model = self.subwayDatas[self.selected1];
            RAOptionModel *item = model.data.block[indexPath.row];
            cell.nameLabel.text = item.name;
            cell.check = self.selected2 == indexPath.row;
            
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView == self.tableOne ) {
        self.selected0 = indexPath.row;
        self.selected1 = 0;
        self.selected2 = -1;
    }else if (tableView == self.tableTwo) {
        self.selected1 = indexPath.row;
        self.selected2 = -1;
    }else {
        self.selected2 = indexPath.row;
    }
    
    NSInteger row = [self tableView:self.tableThree numberOfRowsInSection:0];
    if ((tableView == self.tableTwo && row == 0) || tableView == self.tableThree) {
        if (self.completion) {
            self.completion();
        }
    }else {
        
        if (row > 0) {
            [self.tableOne mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(ScreenW/3));
            }];
            [self.tableTwo mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(ScreenW/3));
            }];
            [self.tableThree mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(ScreenW/3));
            }];
        }else {
            [self.tableOne mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(ScreenW/2));
            }];
            [self.tableTwo mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(ScreenW/2));
            }];
            [self.tableThree mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@(0));
            }];
        }
    }
    [self.tableOne reloadData];
    [self.tableTwo reloadData];
    [self.tableThree reloadData];
}

#pragma mark - 懒加载
- (UITableView *)tableOne {
    if (_tableOne == nil) {
        _tableOne = [[UITableView alloc] init];
        _tableOne.showsVerticalScrollIndicator = NO;
        _tableOne.backgroundColor = [UIColor whiteColor];
        _tableOne.dataSource = self;
        _tableOne.delegate = self;
        _tableOne.rowHeight = 50;
        _tableOne.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableOne.tableFooterView = [UIView new];
    }
    return _tableOne;
}

- (UITableView *)tableTwo {
    if (_tableTwo == nil) {
        _tableTwo = [[UITableView alloc] init];
        _tableTwo.showsVerticalScrollIndicator = NO;
        _tableTwo.backgroundColor = [UIColor colorWithRGB:0xF8F8F8];
        _tableTwo.dataSource = self;
        _tableTwo.delegate = self;
        _tableTwo.rowHeight = 50;
        _tableTwo.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableTwo.tableFooterView = [UIView new];
    }
    return _tableTwo;
}

- (UITableView *)tableThree {
    if (_tableThree == nil) {
        _tableThree = [[UITableView alloc] init];
        _tableThree.showsVerticalScrollIndicator = NO;
        _tableThree.backgroundColor = [UIColor colorWithRGB:0xF4F4F4];
        _tableThree.dataSource = self;
        _tableThree.delegate = self;
        _tableThree.rowHeight = 50;
        _tableThree.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableThree.tableFooterView = [UIView new];
    }
    return _tableThree;
}


- (NSArray *)areaDatas {
    if (_areaDatas == nil) {
        _areaDatas = [RAFPHouseFiltModel model].distinct_block_option;
    }
    return _areaDatas;
}

- (NSArray *)subwayDatas {
    if (_subwayDatas == nil) {
        _subwayDatas = [RAFPHouseFiltModel model].subway_data;
    }
    return _subwayDatas;
}

- (NSArray *)firstTableTitles {
    if (_firstTableTitles == nil) {
        _firstTableTitles = @[@"区域",@"地铁"];
    }
    return _firstTableTitles;
}
@end
