//
//  RAFiltMainButton.m
//  RoomAgent
//
//  Created by sky on 2019/5/9.
//  Copyright © 2019 lejuMac. All rights reserved.
//

#import "RAFiltMainButton.h"
#import "UIColor+TAToolkit.h"

@interface RAFiltMainButton()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, assign) BOOL highLight;
@end

@implementation RAFiltMainButton

+ (instancetype)viewFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil].lastObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addGestureRecognizer:self.tap];
}

- (void)clearData {
    self.dataManager.selectedIndex = 0;
    self.selected = NO;
    self.titleLabel.text = self.dataManager.baseTitle;
}

- (void)tapAction {
    
    self.selected = !self.selected;
    
    if (self.clickAction) {
        self.clickAction(self.tag);
    }
}

- (void)setDataManager:(RAFiltData *)dataManager {
    _dataManager = dataManager;
    self.titleLabel.text = dataManager.showTitle?:dataManager.baseTitle;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    self.highLight = selected || self.dataManager.selectedParams.length > 0;
    self.imageView.image = [UIImage imageNamed:selected?@"filter_selected":@"filter_unselect"];
}

- (void)changeStatus {
    self.titleLabel.text = self.dataManager.showTitle;
    self.highLight = self.dataManager.selectedParams.length > 0;
}

- (void)setHighLight:(BOOL)highLight {
    _highLight = highLight;
    if (highLight) {
        self.titleLabel.textColor = [UIColor appDefaultColor];
    }else {
        self.titleLabel.textColor = [UIColor textDarkGrayColor];
    }
}

- (UITapGestureRecognizer *)tap {
    if (_tap == nil) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    }
    return _tap;
}


@end

