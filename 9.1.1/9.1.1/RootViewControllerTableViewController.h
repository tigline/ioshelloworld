//
//  RootViewControllerTableViewController.h
//  9.1.1
//
//  Created by Charles.Zhu on 2016-6-2.
//  Copyright © 2016年 moveclub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesList.h"

@interface RootViewControllerTableViewController : UITableViewController

@property (copy, nonatomic) NSArray *familyNames;
@property (assign, nonatomic) CGFloat cellPointSize;
@property (strong, nonatomic) FavoritesList *favoritesList;


@end
