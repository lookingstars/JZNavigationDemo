//
//  FRDBaseTransitionAnimator.m
//  Frodo
//
//  Created by jinzelu on 16/11/23.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

@import UIKit;
#import "FRDBaseTransitionAnimator.h"

@implementation FRDBaseTransitionAnimator

- (instancetype)init {
  if (self = [super init]) {
    self.duration = 0.5f;
  }
  return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

  UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView *toView = toVC.view;
  UIView *fromView = fromVC.view;

  [self animateTransition:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
  NSAssert(NO, @"Subclass should override this method");
}

@end
