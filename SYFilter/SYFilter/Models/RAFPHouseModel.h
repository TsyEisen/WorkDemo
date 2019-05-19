//
//  RAFPHouseModel.h
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAFPHouseModel : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *citycode;
@property (nonatomic, copy) NSString *post_hits;
@property (nonatomic, copy) NSString *create_time;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *published_time;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *end_time;
@property (nonatomic, copy) NSString *start_price;
@property (nonatomic, copy) NSString *start_unitprice;
@property (nonatomic, copy) NSString *market_price;
@property (nonatomic, copy) NSString *market_unitprice;
@property (nonatomic, copy) NSString *deposite_cash;
@property (nonatomic, copy) NSString *deposite_cash_time;
@property (nonatomic, copy) NSString *auction_step;
@property (nonatomic, copy) NSString *auction_status;  //1即将开始,2正在拍卖，3拍卖成功,4流拍,5, 终止暂缓
@property (nonatomic, copy) NSString *district;
@property (nonatomic, copy) NSString *block;
@property (nonatomic, copy) NSString *buildingarea;
@property (nonatomic, copy) NSString *model_room;
@property (nonatomic, copy) NSString *model_hall;
@property (nonatomic, copy) NSString *time_limit;
@property (nonatomic, copy) NSString *home_type;
@property (nonatomic, copy) NSString *communityname;
@property (nonatomic, copy) NSString *sina_id;
@property (nonatomic, copy) NSString *orientation;
@property (nonatomic, copy) NSString *usage;
@property (nonatomic, copy) NSString *built_time;
@property (nonatomic, copy) NSString *picurl;
@property (nonatomic, copy) NSString *vr_url;
@property (nonatomic, copy) NSString *video_url;
@property (nonatomic, copy) NSString *floor;
@property (nonatomic, copy) NSString *housetitle;
@property (nonatomic, copy) NSString *trade_housetype;
@property (nonatomic, copy) NSString *staff_id1;
@property (nonatomic, copy) NSString *staff_id2;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *premises_permit;
@property (nonatomic, copy) NSString *ruling_book_number;
@property (nonatomic, copy) NSString *disposal_unit;    //法院名称 返回空字符串显示数据待更新
@property (nonatomic, copy) NSString *fitment;
@property (nonatomic, copy) NSString *house_fee;
@property (nonatomic, copy) NSString *loans;
@property (nonatomic, copy) NSString *from_api;
@property (nonatomic, copy) NSString *is_fangyou;
@property (nonatomic, copy) NSString *districtName;
@property (nonatomic, copy) NSString *blockName;
@property (nonatomic, copy) NSString *homeTypeName;
@property (nonatomic, copy) NSString *auctionStepName;
@property (nonatomic, copy) NSString *auctionStatusName;
@property (nonatomic, copy) NSString *fitmentName;
@property (nonatomic, copy) NSString *modelRoomName;
@property (nonatomic, copy) NSString *deposite_cash_time_str;
@property (nonatomic, copy) NSString *housetitle_hl;
@end

NS_ASSUME_NONNULL_END
