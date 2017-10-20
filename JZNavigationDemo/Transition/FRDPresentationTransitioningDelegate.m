//
//  FRDPresentationTransitioningDelegate.m
//  Frodo
//
//  Created by jinzelu on 16/11/23.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

#import "FRDPresentationTransitioningDelegate.h"
#import "FRDPresentationController.h"

@implementation FRDPresentationTransitioningDelegate

- (CGRect)frd_presentedViewControllerFrame
{
  NSAssert(NO, @"Subclass should override this method");
  return CGRectZero;
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
  self.animator.isPresenting = YES;
  return self.animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  self.animator.isPresenting = NO;
  return self.animator;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
  CGRect frame = CGRectEqualToRect(self.presentedVCFrame, CGRectZero) ? [UIScreen mainScreen].bounds : self.presentedVCFrame;
  return [[FRDPresentationController alloc] initWithPresentedViewController:presented
                                                   presentingViewController:presenting
                                                           presentedVCFrame:frame];
}

@end
