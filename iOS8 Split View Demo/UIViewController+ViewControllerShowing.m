//
//  UIViewController+ViewControllerShowing.m
//  iOS8 Split View Demo
//
//  Created by Daniel Tull on 27/09/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "UIViewController+ViewControllerShowing.h"

@implementation UIViewController (ViewControllerShowing)

- (BOOL)willShowingViewControllerPushWithSender:(id)sender {
	UIViewController *target = [self targetViewControllerForAction:_cmd sender:sender];
	return [target willShowingViewControllerPushWithSender:sender];
}

- (BOOL)willShowingDetailViewControllerPushWithSender:(id)sender {
	UIViewController *target = [self targetViewControllerForAction:_cmd sender:sender];
	return [target willShowingDetailViewControllerPushWithSender:sender];
}

@end



@implementation UINavigationController (ViewControllerShowing)

- (BOOL)willShowingViewControllerPushWithSender:(id)sender {
	return YES;
}

@end



@implementation UISplitViewController (ViewControllerShowing)

- (BOOL)willShowingViewControllerPushWithSender:(id)sender {
	return NO;
}

- (BOOL)willShowingDetailViewControllerPushWithSender:(id)sender {

	if (!self.collapsed) {
		return NO;
	}

	UIViewController *target = [self.viewControllers lastObject];
	return [target willShowingViewControllerPushWithSender:sender];
}

@end
