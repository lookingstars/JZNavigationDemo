//
//  ViewController.m
//  JZNavigationDemo
//
//  Created by jinzelu on 2017/10/20.
//  Copyright © 2017年 Jinzelu Inc. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableViewController.h"
#import "JZNavigationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.frame = CGRectMake(40, 100, 80, 40);
  [button setTitle:@"press" forState:UIControlStateNormal];
  [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  [button addTarget:self action:@selector(_jz_pressButtonAction) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

- (void)_jz_pressButtonAction
{
  FirstTableViewController *controller = [[FirstTableViewController alloc] init];
  JZNavigationViewController *nav = [[JZNavigationViewController alloc] initWithRootViewController:controller];
  [self presentViewController:nav animated:YES completion:nil];
}

@end
