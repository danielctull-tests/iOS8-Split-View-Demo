//
//  DetailViewController.m
//  iOS8 Split View Demo
//
//  Created by Daniel Tull on 27/09/2014.
//  Copyright (c) 2014 Daniel Tull. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, weak) IBOutlet UILabel *detailDescriptionLabel;
@end

@implementation DetailViewController

#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self configureView];
}

#pragma mark - DetailViewController

- (void)setDetailItem:(id)newDetailItem {
	_detailItem = newDetailItem;
	[self configureView];
}

- (void)configureView {
	if (self.detailItem && self.isViewLoaded) {
		self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

@end
