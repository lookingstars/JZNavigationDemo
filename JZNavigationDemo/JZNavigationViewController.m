//
//  JZNavigationViewController.m
//  JZNavigationDemo
//
//  Created by jinzelu on 2017/10/20.
//  Copyright © 2017年 Jinzelu Inc. All rights reserved.
//

#import "JZNavigationViewController.h"
#import "FRDPresentationTransitioningDelegate.h"
#import "FRDSpringTransitionAnimator.h"

@interface JZNavigationViewController ()

@property (nonatomic, strong) FRDPresentationTransitioningDelegate *presentationDelegate;
@property (nonatomic, strong) FRDSpringTransitionAnimator *animator;

@end

@implementation JZNavigationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nil bundle:nil];
  if (self) {
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self.presentationDelegate;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

#pragma mark - property

- (FRDPresentationTransitioningDelegate *)presentationDelegate
{
  if (!_presentationDelegate) {
    _presentationDelegate = [[FRDPresentationTransitioningDelegate alloc] init];
    _presentationDelegate.animator = self.animator;
    _presentationDelegate.presentedVCFrame = [self _frd_presentedViewControllerFrame];
  }
  return _presentationDelegate;
}

- (FRDSpringTransitionAnimator *)animator
{
  if (!_animator) {
    _animator = [[FRDSpringTransitionAnimator alloc] init];
  }
  return _animator;
}

- (CGRect)_frd_presentedViewControllerFrame
{
  CGRect frame = [UIScreen mainScreen].bounds;
  return CGRectMake(0, frame.size.height - 300, frame.size.width, 300);
}


@end
