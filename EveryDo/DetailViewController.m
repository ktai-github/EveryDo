//
//  DetailViewController.m
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () 

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
  if (_detailItem != newDetailItem) {
      _detailItem = newDetailItem;
          
      // Update the view.
      [self configureView];
  }
}


- (void)configureView {
  // Update the user interface for the detail item.
  if (self.detailItem) {
      self.detailDescriptionLabel.text = [self.detailItem description];
    self.titleLabel.text = [self.detailItem title];
    self.toDoDescriptionLabel.text = [self.detailItem toDoDescription];
    self.toDoDescriptionLabel.numberOfLines = 0;
    [self.toDoDescriptionLabel sizeToFit];
    self.priorityLabel.text = [NSString stringWithFormat:@"priority %d", [self.detailItem priorityNumber]];
    
    if ([self.detailItem isCompleted] == TRUE) {
      self.isCompletedLabel.text = @"done";
    } else {
      self.isCompletedLabel.text = @"to do";
    }

  }
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
