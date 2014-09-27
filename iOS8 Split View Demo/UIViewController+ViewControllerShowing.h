//
//  UIViewController+ViewControllerShowing.h
//  iOS8 Split View Demo
//
//  Created by Daniel Tull on 27/09/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

@import UIKit;

@interface UIViewController (ViewControllerShowing)

- (BOOL)willShowingViewControllerPushWithSender:(id)sender;

- (BOOL)willShowingDetailViewControllerPushWithSender:(id)sender;

@end
