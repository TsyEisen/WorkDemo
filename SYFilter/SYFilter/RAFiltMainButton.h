//
//  RAFiltMainButton.h
//  RoomAgent
//
//  Created by sky on 2019/5/9.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAHouseManageFiltModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAFiltMainButton : UIView
@property (nonatomic, copy) void (^clickAction)(NSInteger index);
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) RAFiltData *dataManager;
- (void)clearData;
- (void)changeStatus;
+ (instancetype)viewFromNib;
@end

NS_ASSUME_NONNULL_END
