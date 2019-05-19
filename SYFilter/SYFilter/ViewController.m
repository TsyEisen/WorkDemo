//
//  ViewController.m
//  SYFilter
//
//  Created by Lover on 2019/5/16.
//  Copyright © 2019 Lover. All rights reserved.
//

#import "ViewController.h"
#import "RAFPFilterView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property(nonatomic,strong)RAFPFilterView *filterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.filterView];
}

- (void)requestData {
    NSLog(@"请求数据---%@",self.filterView.paramstr);
}

- (RAFPFilterView *)filterView {
    if (_filterView == nil) {
        _filterView = [[RAFPFilterView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
        
            __weak typeof(self) weakSelef = self;
        [_filterView setCompletion:^{
            [weakSelef requestData];
        }];
    }
    return _filterView;
}
@end
