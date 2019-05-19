//
//  RAFiltItemButton.h
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAFPHouseFiltModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RAFiltItemButton : UIButton
@property(nonatomic, assign)BOOL check;
@property(nonatomic, strong)RAOptionModel *model;
+ (instancetype)buttonWithModel:(RAOptionModel *)model;
@end

NS_ASSUME_NONNULL_END
