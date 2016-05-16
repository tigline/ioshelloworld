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

@property (strong, nonatomic) YellowViewController *yellowViewController;
@property (strong, nonatomic) BlueViewController *blueViewController;



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
    // 如果blue父视图不存在
    if (!self.blueViewController.view.superview) {
        self.blueViewController = nil;
    } else {
        self.yellowViewController = nil;
    }
    
}

-(IBAction)switchViews :(id)sender{
    NSLog(@"switchViews pressed");
    // 如果yellow父视图不存在
    if (!self.yellowViewController.view.superview) {
        // 如果yellow视图不存在
        if (!self.yellowViewController) {
            self.yellowViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Yellow"];
        }
    } else {
        // 如果blue视图不存在
        if (!self.blueViewController) {
            self.blueViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
        }
    }
    // 开始动画 View Flip字符串是一个标识符,也可以置为nil
    [UIView beginAnimations:@"View Flip" context:NULL];
    // 设置动画过程时长
    [UIView setAnimationDuration:0.4];
    // 设置动画曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    // 如果yellow父视图不存在
    if (!self.yellowViewController.view.superview) {
        // 设置动画效果：从左往右翻转
        // 一共1+4个动画效果，详细参考http://blog.yinghualuo.cn/?p=64
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        // 设置frame
        self.yellowViewController.view.frame = self.view.frame;
        
        [self switchViewFromViewController:self.blueViewController toViewController:self.yellowViewController];
        
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        self.blueViewController.view.frame = self.view.frame;
        [self switchViewFromViewController:self.yellowViewController toViewController:self.blueViewController];
    }
    // 动画准备完毕，开始执行动画
    [UIView commitAnimations];
}

/**
 *  从一个视图控制器切换到另外一个视图控制器
 *
 *  @param fromVC <#fromVC description#>
 *  @param toVC   <#toVC description#>
 */
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
