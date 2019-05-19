//
//  RAFPFiltAreaView.h
//  RoomKeeper
//
//  Created by sky on 2019/5/17.
//  Copyright © 2019 leju. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAFPHouseFiltModel.h"
#import "RAFPFiltBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@interface RAFPFiltAreaView : RAFPFiltBaseView
@property (nonatomic, strong) NSArray *areaDatas;
@property (nonatomic, strong) NSArray *subwayDatas;
@end

NS_ASSUME_NONNULL_END
