//
//  RAHouseManageFiltModel.h
//  RoomAgent
//
//  Created by sky on 2019/5/10.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RASearchData : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *name;
@end

@interface RAFiltData : NSObject
@property (nonatomic, strong) NSArray *datas;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, copy) NSString *selectedParams;
@property (nonatomic, copy) NSString *showTitle;
@property (nonatomic, copy) NSString *baseTitle;
+ (instancetype)modelWithBaseTitle:(NSString *)title;
@end

@interface RAHouseManageFiltModel : NSObject
@property (nonatomic, copy) NSString *isup;
@property (nonatomic, copy) NSString *hasup;
@property (nonatomic, copy) NSString *totalupcount;
@property (nonatomic, copy) NSString *vcountinuse;
@property (nonatomic, copy) NSString *vcounttotal;
@property (nonatomic, copy) NSString *eyecountinuse;
@property (nonatomic, copy) NSString *eyecounttotal;
@property (nonatomic, copy) NSString *newhouseall;
@property (nonatomic, copy) NSString *ispush;
@property (nonatomic, copy) NSString *haspush;
@property (nonatomic, copy) NSString *totalnew;
@property (nonatomic, copy) NSString *synew;
@property (nonatomic, copy) NSString *totaljs;
@property (nonatomic, copy) NSString *syjs;

@property (nonatomic, strong) NSArray *uptype;
@property (nonatomic, strong) NSArray *arealist;
@property (nonatomic, strong) NSArray *salse_up;
@property (nonatomic, strong) NSArray *salse_down;
@property (nonatomic, strong) NSArray *rent_up;
@property (nonatomic, strong) NSArray *rent_down;
@property (nonatomic, strong) NSArray *housetype;
@property (nonatomic, strong) NSArray *propertype;
@property (nonatomic, strong) NSArray *extendtype;
@property (nonatomic, strong) NSArray *isquality;
@property (nonatomic, strong) NSArray *book_flag;

@end

NS_ASSUME_NONNULL_END
