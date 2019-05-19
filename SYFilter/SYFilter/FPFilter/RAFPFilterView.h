//
//  RAFPFilterView.h
//  RoomKeeper
//
//  Created by sky on 2019/5/16.
//  Copyright © 2019 leju. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAFPFilterView : UIView
@property(nonatomic, copy)void(^completion)(void);
@property(nonatomic, copy)NSString *paramstr;
@end

NS_ASSUME_NONNULL_END
