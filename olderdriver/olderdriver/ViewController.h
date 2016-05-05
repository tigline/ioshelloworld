//
//  ViewController.h
//  olderdriver
//
//  Created by Charles.Zhu on 2016-4-26.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
- (IBAction)switchChanged:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toggleControls;
- (IBAction)sliderChanged:(UISlider *)sender;



@end