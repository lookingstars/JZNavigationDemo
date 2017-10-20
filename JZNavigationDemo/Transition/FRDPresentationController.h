//
//  FRDPresentationController.h
//  Frodo
//
//  Created by jinzelu on 16/11/22.
//  Copyright © 2016年 Jinzelu Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRDPresentationController : UIPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController
                       presentingViewController:(UIViewController *)presentingViewController
                               presentedVCFrame:(CGRect)presentedVCFrame;

@end
