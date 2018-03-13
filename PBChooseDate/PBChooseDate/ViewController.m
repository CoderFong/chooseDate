//
//  ViewController.m
//  PBChooseDate
//
//  Created by Playboy on 2018/1/8.
//  Copyright © 2018年 tmkj. All rights reserved.
//

#import "ViewController.h"
#import "PBChooseDateController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"选择日期";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    PBChooseDateController *vc = [[PBChooseDateController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
