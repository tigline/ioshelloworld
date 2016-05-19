//
//  DatePickerViewController.m
//  第七章Pickers
//
//  Created by Charles.Zhu on 2016-5-16.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
// @property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"DatePickerViewController pressed");
    NSDate *now = [NSDate date];
    [self.datePicker setDate:now animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"datePicker时间: %@", date);
    NSString *message = [[NSString alloc] initWithFormat:@"The date and time you selected is %@", date];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Date and Time Selected" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"That's so true!" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
