//
//  MasterViewController.m
//  iOS8 Split View Demo
//
//  Created by Daniel Tull on 27/09/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "UIViewController+ViewControllerShowing.h"

@implementation MasterViewController

#pragma mark - UIViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

	id viewController = segue.destinationViewController;
	if ([viewController isKindOfClass:[UINavigationController class]]) {
		UINavigationController *nav = viewController;
		viewController = nav.topViewController;
	}

	if ([viewController isKindOfClass:[DetailViewController class]]) {
		NSString *string = [self stringForIndexPath:self.tableView.indexPathForSelectedRow];
		DetailViewController *detail = viewController;
		detail.detailItem = string;
	}
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
			  withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

	[super willTransitionToTraitCollection:newCollection
				 withTransitionCoordinator:coordinator];

	if (!self.isViewLoaded) {
		return;
	}

	[self.tableView reloadRowsAtIndexPaths:self.tableView.indexPathsForVisibleRows
						  withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - MasterViewController

- (NSString *)stringForIndexPath:(NSIndexPath *)indexPath {
	return [NSString stringWithFormat:@"Row %@", @(indexPath.row)];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	cell.textLabel.text = [self stringForIndexPath:indexPath];

	BOOL pushes = [self willShowingDetailViewControllerPushWithSender:self];
	cell.accessoryType = pushes ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;

	return cell;
}

@end
