//
//  ViewController.m
//  RoomPriceDemo
//
//  Created by leju_esf on 16/10/9.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "ViewController.h"
#import "RPVillageCompareViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushToCompareVC {
    RPVillageCompareViewController *compareVC = [[RPVillageCompareViewController alloc] initWithNibName:NSStringFromClass([RPVillageCompareViewController class]) bundle:nil];
    compareVC.count = 3;
    [self.navigationController pushViewController:compareVC animated:YES];
}

@end
