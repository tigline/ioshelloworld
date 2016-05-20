//
//  SingleComponentPickerViewController.m
//  第七章Pickers
//
//  Created by Charles.Zhu on 2016-5-16.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController () 
@property (weak, nonatomic) IBOutlet UIPickerView *singlePicker;
@property (strong, nonatomic) NSArray *characterNames;
@end



@implementation SingleComponentPickerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"SingleComponentPickerViewController pressed");
    self.characterNames = @[@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando"];
    
    
    
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

- (IBAction)buttonPressed:(UIButton *)sender {
    NSInteger row = [self.singlePicker selectedRowInComponent:0];
    NSString *selected = self.characterNames[row];
    NSString *title = [[NSString alloc] initWithFormat:@"You selected %@!", selected];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:@"Thank you for choosing." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"You're welcome" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}

#pragma mark -
#pragma mark Picker Data Source Methods
/**
 *  滚轮个数
 *
 *  @param pickerView pickerView实例
 *
 *  @return 滚轮个数
 */
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
/**
 *  单个滚轮内容数量
 *
 *  @param pickerView pickerView实例
 *  @param component 从左往右第几个滚轮，从0开始
 *
 *  @return 单个滚轮内容数量
 */
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.characterNames count];
}

#pragma mark Picker Delegate Methods
/**
 *  获取pickerView的内容
 *
 *  @param pickerView pickerView实例
 *  @param row        哪一行数据
 *  @param component  从左往右第几个滚轮，从0开始
 *
 *  @return <#return value description#>
 */
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@%ld", self.characterNames[row], (long)component];
}


@end


