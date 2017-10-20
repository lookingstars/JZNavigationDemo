//
//  FRDPresentationTransitioningDelegate.h
//  Frodo
//
//  Created by jinzelu on 16/11/23.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FRDBaseTransitionAnimator.h"

@interface FRDPresentationTransitioningDelegate : NSObject <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) FRDBaseTransitionAnimator *animator;

/**
 *  可以自定义presented VC的Frame，默认是[UIScreen mainScreen].bounds
 */
@property (nonatomic, assign) CGRect presentedVCFrame;

@end
