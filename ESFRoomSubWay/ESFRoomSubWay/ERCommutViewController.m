//
//  ERCommutViewController.m
//  ESFRoomSubWay
//
//  Created by leju_esf on 16/11/2.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "ERCommutViewController.h"
#import "UIColor+SYExtension.h"
#import "ERCommutSlider.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ERCommutViewController ()<UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchContent;
@property (weak, nonatomic) IBOutlet ERCommutSlider *slider;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, assign) BOOL isSearch;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *numberMargin;
@end

@implementation ERCommutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    [self.searchContent addSubview:self.searchBar];
    [self.slider setThumbImage:[UIImage imageNamed:@"commut_slider"] forState:UIControlStateNormal];
    
    for (NSLayoutConstraint *constraint in self.numberMargin) {
        constraint.constant = (ScreenW - 130)/3;
    }
}



- (IBAction)locationAction {
    
}
- (IBAction)valueChange:(ERCommutSlider *)sender {
    if (sender.value <= 1.0/6) {
        [sender setValue:0 animated:YES];
    }else if (sender.value > 0 && sender.value < 3.0/6) {
        [sender setValue:1.0/3 animated:YES];
    }else if (sender.value >= 3.0/6 && sender.value < 5.0/6) {
        [sender setValue:2.0/3 animated:YES];
    }else if (sender.value >= 5.0/6) {
        [sender setValue:3.0/3 animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.isSearch = YES;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    if (searchBar.text.length > 0) {
        //点击输入搜索框
        [self clickSeacher:searchBar];
    }else {
        if (self.isSearch) {
            //点击了清除
            self.isSearch = NO;
        }else {
            //点击输入搜索框
            [self clickSeacher:searchBar];
        }
    }
    return NO;
}

- (void)clickSeacher:(UISearchBar *)searchBar {
    NSLog(@"点击了搜索");
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Search" bundle:nil];
//    ERSearchViewController *searchNav = [sb instantiateViewControllerWithIdentifier:@"ERSearchViewController"];
//    searchNav.iSearchType = _iSearchType;
//    searchNav.isSearch = ERSearchDefault;
//    searchNav.iSearchContent = _iSearchStr;
//    searchNav.isSearchMap = YES;
//    [self.navigationController pushViewController:searchNav animated:YES];
}

- (UISearchBar *)searchBar {
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.frame = CGRectMake(0, 0, ScreenW - 75, 45);
        _searchBar.barTintColor = [UIColor sy_colorWithRGB:0xF0F0F0];
        _searchBar.searchResultsButtonSelected = YES;
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor clearColor];
        _searchBar.tintColor = [UIColor sy_colorWithRGB:0xF9F9F9];
        _searchBar.placeholder = @"请输入公司地址";
        _searchBar.tag = 999;
        // 添加背景
        for (UIView *subview in [_searchBar.subviews objectAtIndex:0].subviews) {
            
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [subview removeFromSuperview];
            }
            
            if ([subview isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                subview.backgroundColor = [UIColor sy_colorWithRGB:0xF0F0F0];
            }
        }
    }
    return _searchBar;
}

@end
