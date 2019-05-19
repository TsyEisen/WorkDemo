//
//  RAFiltBlockCell.h
//  SYFilter
//
//  Created by Lover on 2019/5/19.
//  Copyright © 2019 Lover. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RAFiltBlockCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,assign)BOOL check;
@end

NS_ASSUME_NONNULL_END
