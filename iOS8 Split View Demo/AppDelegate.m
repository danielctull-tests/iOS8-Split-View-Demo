//
//  AppDelegate.m
//  iOS8 Split View Demo
//
//  Created by Daniel Tull on 27/09/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UISplitViewController *splitViewController = (UISplitViewController *)self.window.rootViewController;
	splitViewController.delegate = self;
	return YES;
}

#pragma mark - UISplitViewControllerDelegate

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
			  inOrientation:(UIInterfaceOrientation)orientation  {
	return NO;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController
collapseSecondaryViewController:(UIViewController *)secondaryViewController
  ontoPrimaryViewController:(UIViewController *)primaryViewController {

	return ![self viewControllerContainsDetailViewController:secondaryViewController];
}

- (UIViewController *)splitViewController:(UISplitViewController *)splitViewController
separateSecondaryViewControllerFromPrimaryViewController:(UIViewController *)primaryViewController {

	BOOL defaultBehavior = [self viewControllerContainsDetailViewController:primaryViewController];
	if (defaultBehavior) return nil;

	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	return [storyboard instantiateViewControllerWithIdentifier:@"NoSelection"];
}

- (BOOL)viewControllerContainsDetailViewController:(UIViewController *)viewController {

	if ([viewController isKindOfClass:[DetailViewController class]]) return YES;

	for (UIViewController *childViewController in viewController.childViewControllers) {
		if ([self viewControllerContainsDetailViewController:childViewController]) {
			return YES;
		}
	}

	return NO;
}

@end
