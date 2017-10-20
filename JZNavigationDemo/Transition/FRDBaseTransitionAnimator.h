//
//  FRDBaseTransitionAnimator.h
//  Frodo
//
//  Created by jinzelu on 16/11/23.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

@import UIKit;
#import <Foundation/Foundation.h>

@interface FRDBaseTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresenting;
/**
 The animation duration.
 */
@property (nonatomic, assign) NSTimeInterval duration;

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
                   fromVC:(UIViewController *)fromVC
                     toVC:(UIViewController *)toVC
                 fromView:(UIView *)fromView
                   toView:(UIView *)toView;

@end
