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
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // statusLabel.textAlignment = UITextAlignmentCenter;
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
    self.sliderLabel.text = @"50";
    // [self.segmentedControl insertSegmentWithTitle:@"第三个" atIndex:2 animated:YES];
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
    NSLog(@"buttonPressed");
    // 创建一个从下往上浮动的提示框
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Are You Sure?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // 提示框的第一个action以及action的事件
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes, I'm sure!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
        NSString *msg;
        if ([self.nameField.text length] > 0) {
            msg = [NSString stringWithFormat:@"You can breathe easy, %@, everything went OK.", self.nameField.text];
        } else {
            msg = @"You can breathe easy, evetything went OK.";
        }
        UIAlertController *controller2 = [UIAlertController alertControllerWithTitle:@"Something Was Done" message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Phew!" style:UIAlertActionStyleCancel handler:nil];
        [controller2 addAction:cancelAction];
        [self presentViewController:controller2 animated:YES completion:nil];
    }];
    // 提示框的第二个action以及action的事件
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No way!" style:UIAlertActionStyleCancel handler:nil];
    // 'UIAlertController can only have one action with a style of UIAlertActionStyleCancel'
    // UIAlertAction *threeAction = [UIAlertAction actionWithTitle:@"No way!" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:yesAction];
    [controller addAction:noAction];
    // [controller addAction:threeAction];
    
    UIPopoverPresentationController *ppc = controller.popoverPresentationController;
    if (ppc != nil) {
        // IPAD 等大屏设备弹出提示框
        ppc.sourceView = sender;
        ppc.sourceRect = sender.bounds;
        ppc.permittedArrowDirections = UIPopoverArrowDirectionUnknown;
    }
    // [self presentViewController:controller animated:YES completion:nil];
    [self presentViewController:controller animated:YES completion:nil];
}
@end

