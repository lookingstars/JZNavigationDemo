//
//  FRDSpringTransitionAnimator.m
//  Frodo
//
//  Created by jinzelu on 16/11/22.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

#import "FRDSpringTransitionAnimator.h"

@implementation FRDSpringTransitionAnimator

#pragma mark - Override

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
  if (self.isPresenting) {
    [self _frd_animatePresentationWithTransitionContext:transitionContext];
  } else {
    [self _frd_animateDismissWithTransitionContext:transitionContext];
  }
}

#pragma mark - Private

- (void)_frd_animatePresentationWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIView *containerView = [transitionContext containerView];

  UIView *toView = toViewController.view;

  [containerView addSubview:toView];

  CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
  toView.frame = finalFrame;

  CGPoint center = toView.center;
  center.y += containerView.bounds.size.height;
  toView.center = center;

  [UIView animateWithDuration:[self transitionDuration:transitionContext]
                        delay:0.0
       usingSpringWithDamping:1.0
        initialSpringVelocity:0.0
                      options:UIViewAnimationOptionCurveLinear
                   animations:^{
                     CGPoint center = toView.center;
                     center.y -= containerView.bounds.size.height;
                     toView.center = center;
                   } completion:^(BOOL finished) {
                     [transitionContext completeTransition:finished];
                   }];
}

- (void)_frd_animateDismissWithTransitionContext:(id <UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIView *containerView = [transitionContext containerView];
  UIView *fromeView = fromViewController.view;

  [UIView animateWithDuration:[self transitionDuration:transitionContext]
                        delay:0.0
       usingSpringWithDamping:1.0
        initialSpringVelocity:0.0
                      options:UIViewAnimationOptionCurveLinear
                   animations:^{
                     CGPoint center = fromeView.center;
                     center.y += containerView.bounds.size.height;
                     fromeView.center = center;
                   } completion:^(BOOL finished) {
                     [transitionContext completeTransition:finished];
                   }];
}

@end
