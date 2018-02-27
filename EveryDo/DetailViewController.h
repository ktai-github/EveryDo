//
//  DetailViewController.h
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *isCompletedLabel;

@end

