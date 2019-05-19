//
//  RAHouseManageFiltModel.m
//  RoomAgent
//
//  Created by sky on 2019/5/10.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import "RAHouseManageFiltModel.h"

@implementation RAFiltData

+ (instancetype)modelWithBaseTitle:(NSString *)title {
    RAFiltData *model = [RAFiltData new];
    model.baseTitle = title;
    return model;
}

- (instancetype)init {
    if (self = [super init]) {
        RASearchData *search = [RASearchData new];
        search.name = @"全部";
        self.datas = @[search];
    }
    return self;
}

- (void)setDatas:(NSArray *)datas {
    NSMutableArray *tempArray = [NSMutableArray array];
    RASearchData *search = [RASearchData new];
    search.name = @"全部";
    [tempArray addObject:search];
    [tempArray addObjectsFromArray:datas];
    _datas = tempArray;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (selectedIndex == 0) {
        self.showTitle = self.baseTitle;
        self.selectedParams = nil;
    }else {
        RASearchData *search = self.datas[selectedIndex];
        self.showTitle = search.name;
        self.selectedParams = search.code;
    }
}

@end

@implementation RASearchData


@end

@implementation RAHouseManageFiltModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"uptype":@"RASearchData",
             @"arealist":@"RASearchData",
             @"salse_up":@"RASearchData",
             @"salse_down":@"RASearchData",
             @"rent_up":@"RASearchData",
             @"rent_down":@"RASearchData",
             @"housetype":@"RASearchData",
             @"propertype":@"RASearchData",
             @"extendtype":@"RASearchData",
             @"isquality":@"RASearchData",
             @"book_flag":@"RASearchData"
             };
}
@end
