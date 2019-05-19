//
//  RAHouseManageHomeData.h
//  RoomAgent
//
//  Created by sky on 2019/5/10.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAHouseManageHomeReliableModel : NSObject
@property (nonatomic, copy) NSString *communityname;
@property (nonatomic, copy) NSString *countup;
@property (nonatomic, copy) NSString *countrz;
@property (nonatomic, copy) NSString *totalhits;
@end

@interface RAHouseManageHomeHouse : NSObject
@property (nonatomic, copy) NSString *isup;
@property (nonatomic, copy) NSString *totalupcount;
@property (nonatomic, copy) NSString *newhouseall;
@property (nonatomic, copy) NSString *clickcount;
@property (nonatomic, strong) NSArray *housepv;
@end

@interface RAHouseManageHomeBreview : NSObject
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *pv;
@end

@interface RAHouseManageHomeData : NSObject
@property (nonatomic, strong) RAHouseManageHomeHouse *houseinfo;
@property (nonatomic, strong) NSArray *notice;
@property (nonatomic, strong) NSArray *reliableinfo;

@end

NS_ASSUME_NONNULL_END
