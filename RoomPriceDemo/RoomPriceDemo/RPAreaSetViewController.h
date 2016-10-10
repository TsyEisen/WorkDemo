//
//  RPAreaSetViewController.h
//  RoomPriceDemo
//
//  Created by leju_esf on 16/10/10.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPAreaSetViewController : UIViewController

@end

typedef NS_ENUM(NSUInteger, RPAreaItemType) {
    RPAreaItemTypeCare,
    RPAreaItemTypeOther
};

@interface RPAreaItem : UIView
@property (nonatomic, assign) RPAreaItemType type;
@property (nonatomic, copy) void (^selectedAction)(NSInteger tag);
- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;
@end
