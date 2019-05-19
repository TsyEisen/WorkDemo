//
//  RAFPHouseModel.m
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import "RAFPHouseModel.h"

@implementation RAFPHouseModel
- (NSString *)disposal_unit {
    if (_disposal_unit.length > 0) {
        return _disposal_unit;
    }else {
        return @"数据待更新";
    }
}
@end
