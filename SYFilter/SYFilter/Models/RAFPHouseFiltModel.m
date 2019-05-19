//
//  RAFPHouseFiltModel.m
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import "RAFPHouseFiltModel.h"
#import "MJExtension.h"
@implementation RAFPHouseFiltModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"price":@"RAOptionModel",
             @"area":@"RAOptionModel",
             @"room":@"RAOptionModel",
             @"fhousestep":@"RAOptionModel",
             @"fhousestatus":@"RAOptionModel",
             @"distinct_block_option":@"RAOptionModel",
             @"subway_data":@"RAOptionModel",
             };
}

+ (instancetype)model {
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"fpHouseFiltData" ofType:@"plist"]];
    RAFPHouseFiltModel *model = [RAFPHouseFiltModel mj_objectWithKeyValues:dict];
    return model;
}
@end

@implementation RAOptionModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"block":@"RAOptionModel"
             };
}

@end
