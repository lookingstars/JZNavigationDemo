//
//  FirstTableViewController.m
//  JZNavigationDemo
//
//  Created by jinzelu on 2017/10/20.
//  Copyright © 2017年 Jinzelu Inc. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@property (nonatomic, copy) NSArray<NSString *> *titleArray;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSArray *)titleArray
{
  if (!_titleArray) {
    _titleArray = @[@"1", @"2", @"3", @"4", @"5"];
  }
  return _titleArray;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.titleArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])  forIndexPath:indexPath];

  cell.textLabel.text = self.titleArray[indexPath.row];

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  FirstTableViewController *controller = [[FirstTableViewController alloc] init];
  [self.navigationController pushViewController:controller animated:YES];
}

@end
