//
//  ViewController.h
//  第六章
//
//  Created by Charles.Zhu on 2016-5-12.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YellowViewController.h"
#import "BlueViewController.h"

@interface SwitchingViewController : UIViewController

@property (strong, nonatomic) YellowViewController *yellowViewController;
@property (strong, nonatomic) BlueViewController *blueViewController;


-(IBAction)switchViews:(id)sender;

@end

