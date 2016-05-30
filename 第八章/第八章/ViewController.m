//
//  ViewController.m
//  第八章
//
//  Created by Charles.Zhu on 2016-5-30.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
// copy  复制了一下变量的指针
@property (copy, nonatomic) NSArray *dwarves;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.2
    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin", @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin", @"Gloin", @"Bifur", @"Bofur", @"Bombur"];
    // 字典序排序 教材里面没有这个排序
    self.dwarves = [self.dwarves sortedArrayUsingSelector:@selector(compare:)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 获取tableView数据行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dwarves count];
}

// 获取tableView每行具体的UITableViewCell，view控件不会缓存任何屏幕上不显示的数据，会实时调用这个方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld", (long)indexPath.row);
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        // 默认样式，没有副标题
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        // 主副标题类型的样式
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
        // 左主标题，右副标题,两端对齐
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:SimpleTableIdentifier];
        // 左主标题，右副标题,中轴对齐，主标题变蓝色，类似电影结束时的排版样式
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:SimpleTableIdentifier];
    }
    
    // 给每个UITableViewCell左侧添加一个图片，UIImage使用一种基于文件名的缓存机制，不会每次调用UIImage imageNamed方法
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    UIImage *highlightedImage = [UIImage imageNamed:@"star2"];
    cell.imageView.highlightedImage = highlightedImage;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    // 字体
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    if (indexPath.row < 7) {
        cell.detailTextLabel.text = @"Mr.Disney";
    } else {
        cell.detailTextLabel.text = @"Mr.Tolkien";
    }
    
    
    return cell;
}
// 单个tableView的缩进级别
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row % 4;
}

// 点击某个item后即刻执行的事件 inside down
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return nil;
    } else if (indexPath.row % 2 == 0) {
        // 选中当前item的下一个
        return [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    } else {
        return indexPath;
    }
}

// 点击某个item完毕后执行的事件 inside up
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Row Selected!" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Yes I Did" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
    // 取消item选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// UITableViewCell 的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == 0 ? 120 : 70;
}

@end
