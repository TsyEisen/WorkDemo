//
//  RAHouseManageHomeData.m
//  RoomAgent
//
//  Created by sky on 2019/5/10.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import "RAHouseManageHomeData.h"

@implementation RAHouseManageHomeReliableModel

@end

@implementation RAHouseManageHomeHouse
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"housepv":@"RAHouseManageHomeBreview",
             };
}
@end

@implementation RAHouseManageHomeData
+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"reliableinfo":@"RAHouseManageHomeReliableModel",
             };
}
@end

@implementation RAHouseManageHomeBreview

@end
