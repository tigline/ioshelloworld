//
//  ViewController.m
//  8.4.2
//
//  Created by Charles.Zhu on 2016-5-31.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import "ViewController.h"
#import "SearchResultsController.h"

static NSString *SectionsTableIdentifier = @"SectionsTableIdentifier";

@interface ViewController ()

@property (copy, nonatomic) NSDictionary *names;
@property (copy, nonatomic) NSArray *keys;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 为tableView注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:SectionsTableIdentifier];
    // 列表显示的数据来源
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    // 转换成NSDictionary
    self.names = [NSDictionary dictionaryWithContentsOfFile:path];
    // 抽取XML文件里面数据的第一层作为KEY
    self.keys = [[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
    

    // 搜索栏****************************
    // new一个搜索Controller示例
    SearchResultsController *resultsController = [[SearchResultsController alloc] initWithName:self.names keys:self.keys];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:resultsController];
    // searchController 是strong的，所有使用它的变量的会直接产生变化，类似于C语言的 &searchController
    UISearchBar *searchBar = self.searchController.searchBar;
    searchBar.scopeButtonTitles = @[@"All", @"Short", @"Long"];
    searchBar.placeholder = @"搜索框";
    // 根据searchBar实际大小给searchBar一个合适的布局大小
    // http://www.07net01.com/2014/09/180586.html 要翻墙。
    [searchBar sizeToFit];
    self.tableView.tableHeaderView = searchBar;
    self.searchController.searchResultsUpdater = resultsController;
    // 搜索栏****************************
    
    
    // 右侧索引栏加上黑色背景底
    self.tableView.sectionIndexBackgroundColor = [UIColor blackColor];
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor darkGrayColor];
    // 右侧索引字变成白色
    self.tableView.sectionIndexColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table View Data Source Methods

// 获取选区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.keys count];
}

// 获取某个选区内容的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = self.keys[section];
    NSArray *nameSection = self.names[key];
    return [nameSection count];
}

// 获取某个选区的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.keys[section];
}

// 获取某个选区某个item的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionsTableIdentifier forIndexPath:indexPath];
    NSString *key = self.keys[indexPath.section];
    NSArray *nameSection = self.names[key];
    cell.textLabel.text = nameSection[indexPath.row];
    return cell;
}

// 右侧添加快速定位的索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.keys;
}


@end
