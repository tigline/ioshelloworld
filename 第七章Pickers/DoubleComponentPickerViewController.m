//
//  DoubleComponentPickerViewController.m
//  第七章Pickers
//
//  Created by Charles.Zhu on 2016-5-16.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

// 宏定义
#define kFilingComponent 0
#define kBreadCompenent  1

@interface DoubleComponentPickerViewController ()
// 输入输出口
@property (weak, nonatomic) IBOutlet UIPickerView *doublePicker;
@property(strong, nonatomic) NSArray *fillingTypes;
@property(strong, nonatomic) NSArray *breadTypes;


@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化两个滚轴数据内容数组
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad", @"Chicken Salad", @"Roast Beff", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough", @"Seven Grain"];
    
    
    // Do any additional setup after loading the view.
    NSLog(@"DoubleComponentPickerViewController pressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonPressed:(id)sender {
    NSInteger fillingRow = [self.doublePicker selectedRowInComponent:kFilingComponent];
    NSInteger breadRow = [self.doublePicker selectedRowInComponent:kBreadCompenent];
    NSString *filling = self.fillingTypes[fillingRow];
    NSString *bread = self.breadTypes[breadRow];
    NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up.", filling, bread];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you for your order" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Great!" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}




#pragma mark -
#pragma mark Picker Delegate Methods
// 滚轴个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
// 单个滚轴内容个数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == kBreadCompenent) {
        return [self.breadTypes count];
    } else {
        return [self.fillingTypes count];
    }
}
// 单个滚轴的单个数据内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == kBreadCompenent) {
        return self.breadTypes[row];
    } else {
        return self.fillingTypes[row];
    }
}


@end



