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


- (void)viewDidLoad {
    [super viewDidLoad];
    // statusLabel.textAlignment = UITextAlignmentCenter;
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}



/*
- (IBAction)click:(id)sender{
    statusLabel.text = [abcTextField text];
    
}
*/

-(IBAction)textFieldDoneEditing:(id)sender {
    [super resignFirstResponder];
}


-(IBAction)backgroundTap:(id)sender{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

@end

