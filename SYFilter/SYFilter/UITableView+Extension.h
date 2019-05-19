//
//  UITableView+RegistCell.h
//  ESFAgent
//
//  Created by leju_esf on 17/4/23.
//  Copyright © 2017年 LEJU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)
//@property (nonatomic, assign) BOOL noData;
#pragma mark - 注册cell
/**
 *  注册自定义cell(有xib)
 *
 *  @param customClass 类名
 */
- (void)rk_registerNibWithClass:(Class)customClass;
/**
 *  注册自定义cell(无xib)
 *
 *  @param customClass 类名
 */
- (void)rk_registerCellWithClass:(Class)customClass;
/**
 *  注册自定义headerFooter(有xib)
 *
 *  @param customClass 类名
 */
- (void)rk_registerHeaderFooterNibWithClass:(Class)customClass;
/**
 *  注册自定义headerFooter(无xib)
 *
 *  @param customClass 类名
 */
- (void)rk_registerHeaderFooterClassWithClass:(Class)customClass;

@end
