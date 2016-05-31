//
//  SearchResultsControllerTableViewController.h
//  8.4.2
//
//  Created by Charles.Zhu on 2016-5-31.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsController : UITableViewController<UISearchResultsUpdating>

- (instancetype)initWithName:(NSDictionary *)names keys:(NSArray *)keys;

@end
