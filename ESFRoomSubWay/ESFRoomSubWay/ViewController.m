//
//  ViewController.m
//  ESFRoomSubWay
//
//  Created by leju_esf on 16/11/2.
//  Copyright © 2016年 tsy. All rights reserved.
//

#import "ViewController.h"
#import "ERCommutViewController.h"

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
- (IBAction)pushToSubWaySetVC {
    ERCommutViewController *commut = [[ERCommutViewController alloc] initWithNibName:NSStringFromClass([ERCommutViewController class]) bundle:nil];
    [self.navigationController pushViewController:commut animated:YES];
}

@end
