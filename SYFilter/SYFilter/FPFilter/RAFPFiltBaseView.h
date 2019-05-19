//
//  RAFPFiltBaseView.h
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAFPFiltBaseView : UIView

@property(nonatomic, assign)CGFloat realHeight;

@property(nonatomic, copy)NSString *paramstr;

@property(nonatomic, copy)void(^completion)(void);

- (void)clearData;

- (void)dismiss;

- (void)show;

@end

NS_ASSUME_NONNULL_END
