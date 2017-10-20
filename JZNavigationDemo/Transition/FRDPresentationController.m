//
//  FRDPresentationController.m
//  Frodo
//
//  Created by jinzelu on 16/11/22.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

#import "FRDPresentationController.h"

@interface FRDPresentationController ()

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, assign) CGRect presentedVCFrame;

@end

@implementation FRDPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController
                               presentedVCFrame:(CGRect)presentedVCFrame
{
  self = [super initWithPresentedViewController:presentedViewController
                       presentingViewController:presentingViewController];
  if (self) {
    self.presentedVCFrame = presentedVCFrame;
  }
  return self;
}

- (UIView *)backgroundView
{
  if (!_backgroundView) {
    _backgroundView = [[UIView alloc] initWithFrame:self.containerView.frame];
    _backgroundView.backgroundColor = [UIColor colorWithRed:1.0/255.0 green:1.0/255.0 blue:1.0/255.0 alpha:0.5];
    _backgroundView.alpha = 0;
  }
  return _backgroundView;
}

- (void)presentationTransitionWillBegin
{
  [self.containerView addSubview:self.backgroundView];

  UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_frd_tapBackgroundView)];
  self.backgroundView.userInteractionEnabled = YES;
  [self.backgroundView addGestureRecognizer:tap];

  [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
    self.backgroundView.alpha = 1.0;
  } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
  // do something
}

- (void)dismissalTransitionWillBegin
{
  [self.presentingViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
    self.backgroundView.alpha = 0.0;
  } completion:nil];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
  if (completed) {
    [self.backgroundView removeFromSuperview];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGRect frame = self.containerView.frame;
  return CGRectEqualToRect(self.presentedVCFrame, CGRectZero) ? frame : self.presentedVCFrame;
}

#pragma mark - Private

- (void)_frd_tapBackgroundView
{
  [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
