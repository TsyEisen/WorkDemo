//
//  RAFPHouseFiltModel.h
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAOptionModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *baidu_x;
@property (nonatomic, copy) NSString *baidu_y;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) RAOptionModel *data;
@property (nonatomic, strong) NSArray *block;
@end

@interface RAFPHouseFiltModel : NSObject
@property (nonatomic, strong) NSArray *price;
@property (nonatomic, strong) NSArray *area;
@property (nonatomic, strong) NSArray *room;
@property (nonatomic, strong) NSArray *fhousestep;
@property (nonatomic, strong) NSArray *fhousestatus;
@property (nonatomic, strong) NSArray *distinct_block_option;
@property (nonatomic, strong) NSArray *subway_data;

+ (instancetype)model;
@end

NS_ASSUME_NONNULL_END
