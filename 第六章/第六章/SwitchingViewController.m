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
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
}

-(IBAction)switchViews :(id)sender{
    NSLog(@"switchViews pressed");
    // Create the new view controller, if required.
    // 判断self.yellowViewController.view.superview是否实例化
    if (!self.yellowViewController.view.superview) {
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
    } else {
        // 判断self.blueViewController实例化
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
        }
    }
    
    // Switch view controllers.切换视图控制器
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (!self.yellowViewController.view.superview) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        self.yellowViewController.view.frame = self.view.frame;
        [self switchViewFromViewController:self.blueViewController toViewController:self.yellowViewController];
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        self.blueViewController.view.frame = self.view.frame;
        [self switchViewFromViewController:self.yellowViewController toViewController:self.blueViewController];
    }
    [UIView commitAnimations];
}

- (void)switchViewFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (fromVC != nil) {
        [fromVC willMoveToParentViewController:nil];
        [fromVC.view removeFromSuperview];
        [fromVC removeFromParentViewController];
    }
    
    if (toVC != nil) {
        [self addChildViewController:toVC];
        [self.view insertSubview:toVC.view atIndex:0];
        [toVC didMoveToParentViewController:self];
    }
}


@end
