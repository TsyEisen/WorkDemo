//
//  RPVillageCompareViewController.m
//  RoomPriceDemo
//
//  Created by leju_esf on 16/10/9.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "RPVillageCompareViewController.h"
#import "RPCompareTitleCell.h"
#import "RPCompareTopView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

#define ItemW (MIN(ScreenW, ScreenH) - 100.0)/2

@interface RPVillageCompareViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (nonatomic, strong) UITableView *rightTableView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) RPCompareTopView *topView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation RPVillageCompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scrollView addSubview:self.topView];
    [self.scrollView addSubview:self.rightTableView];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([RPCompareTitleCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([RPCompareTitleCell class])];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"-======%f",ScreenW);
    self.scrollView.contentSize = CGSizeMake(ItemW * self.count, self.scrollView.frame.size.height);
    self.topView.frame = CGRectMake(0, 0, self.scrollView.contentSize.width, 100);
    self.rightTableView.frame = CGRectMake(0, 100,  self.scrollView.contentSize.width, self.scrollView.frame.size.height - 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)orientChange:(NSNotification *)noti {
    
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    
    NSLog(@"打印现在的设备方向：%ld",(long)orientation);
    switch (orientation)
        {
        case UIDeviceOrientationPortrait: {
            NSLog(@"屏幕竖直");
            self.topViewHeight.constant = 30;
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
        }
            break;
            
        case UIDeviceOrientationLandscapeLeft: {
            NSLog(@"屏幕向左转");
            self.topViewHeight.constant = 0;
            [self.navigationController setNavigationBarHidden:YES animated:NO];
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

        }
            break;
        case UIDeviceOrientationLandscapeRight: {
            NSLog(@"屏幕向右转");
            self.topViewHeight.constant = 0;
            [self.navigationController setNavigationBarHidden:YES animated:NO];
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];

        }
            break;
        default:
            break;
    }
}


#pragma mark - tableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        RPCompareTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RPCompareTitleCell class])];
        cell.compareTitleLabel.text = self.titles[indexPath.row];
        return cell;
    }else {    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.leftTableView || scrollView == self.rightTableView) {
        self.leftTableView.contentOffset = scrollView.contentOffset;
        self.rightTableView.contentOffset = scrollView.contentOffset;
    }
}

- (RPCompareTopView *)topView {
    if (_topView == nil) {
        _topView = [[RPCompareTopView alloc] initWithFrame:CGRectMake(0, 0, ItemW * self.count, 100) andVillages:@[@1,@2,@3]];
        _topView.backgroundColor = [UIColor redColor];
    }
    return _topView;
}

- (UITableView *)rightTableView {
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, 0) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.showsHorizontalScrollIndicator = NO;
        _rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _rightTableView.allowsSelection = NO;
    }
    return _rightTableView;
}

- (NSArray *)titles {
    if (_titles == nil) {
        _titles = @[@"小区均价",@"环比涨幅",@"建筑类型",@"年代",@"绿化率",@"容积率",@"开发商",@"物业",@"教育资源",@"交通通勤",@"吃喝购物",@"医疗保障"];
    }
    return _titles;
}

@end
