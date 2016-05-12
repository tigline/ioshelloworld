//
//  ViewController.m
//  第六章
//
//  Created by Charles.Zhu on 2016-5-12.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "SwitchingViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"



@interface SwitchingViewController ()




@end

@implementation SwitchingViewController
@synthesize blueViewController;
@synthesize yellowViewController;


- (void)viewDidLoad {
    [super viewDidLoad];

    self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    self.blueViewController.view.frame = self.view.frame;
    [self switchViewFromViewController:nil toViewController:self.blueViewController];
    //[self switchViews:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)switchViews :(id)sender{
    NSLog(@"switchViews pressed");

}


@end
