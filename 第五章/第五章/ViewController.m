//
//  ViewController.m
//  第五章
//
//  Created by Charles.Zhu on 2016-5-9.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "ViewController.h"

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

// 控制设备允许的旋转方向
- (NSUInteger)supportedInterfaceOrientations {
    //return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationLandscapeLeft);
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

@end
