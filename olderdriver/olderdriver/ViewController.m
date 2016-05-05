//
//  ViewController.m
//  olderdriver
//
//  Created by Charles.Zhu on 2016-4-26.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameField;
@synthesize numberField;
@synthesize rightSwitch;
@synthesize leftSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // statusLabel.textAlignment = UITextAlignmentCenter;
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    self.sliderLabel.text = @"50";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}




-(IBAction)textFieldDoneEditing:(id)sender {
    [super resignFirstResponder];
}


-(IBAction)backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}


- (IBAction)switchChanged:(UISwitch *)sender {
    NSLog(@"switchChanged");
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
    
}

- (IBAction)toggleControls:(UISegmentedControl *)sender {
    NSLog(@"%ld", (long)sender.selectedSegmentIndex);
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomeThingButton.hidden = YES;
    } else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomeThingButton.hidden = NO;
    }
    
    
}
- (IBAction)sliderChanged:(UISlider *)sender {
    int process = (int) lround(sender.value);
    // double process = sender.value;
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", process];
    
    
}
- (IBAction)buttonPressed:(UIButton *)sender {
}
@end

