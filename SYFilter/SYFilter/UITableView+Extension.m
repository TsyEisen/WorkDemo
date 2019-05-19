//
//  UITableView+RegistCell.m
//  ESFAgent
//
//  Created by leju_esf on 17/4/23.
//  Copyright © 2017年 LEJU. All rights reserved.
//

#import "UITableView+Extension.h"
//#import "EANoResultView.h"

@interface UITableView ()
//@property (nonatomic, strong) EANoResultView *noResultView;
@end

@implementation UITableView (Extension)
#pragma mark - 注册cell
- (void)rk_registerNibWithClass:(Class)customClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(customClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(customClass)];
}
- (void)rk_registerCellWithClass:(Class)customClass {
    [self registerClass:customClass forCellReuseIdentifier:NSStringFromClass(customClass)];
}

- (void)rk_registerHeaderFooterNibWithClass:(Class)customClass {
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(customClass) bundle:nil] forHeaderFooterViewReuseIdentifier:NSStringFromClass(customClass)];
}

- (void)rk_registerHeaderFooterClassWithClass:(Class)customClass {
    [self registerClass:customClass forHeaderFooterViewReuseIdentifier:NSStringFromClass(customClass)];
}

//@dynamic noData;
//
//- (void)setNoData:(BOOL)noData {
//    if (noData) {
//        if (self.noResultView == nil) {
//            self.noResultView = [EANoResultView noResultViewWithView:self message:nil];
//        }
//        self.noResultView.hidden = NO;
//        
//    }else {
//        self.noResultView.hidden = YES;
//    }
//}
//
//static const char NoDataKey = '\1';
//- (void)setNoResultView:(EANoResultView *)noResultView {
//    objc_setAssociatedObject(self, &NoDataKey, noResultView, OBJC_ASSOCIATION_RETAIN);
//}
//
//- (EANoResultView *)noResultView {
//    return objc_getAssociatedObject(self, &NoDataKey);
//}

@end
