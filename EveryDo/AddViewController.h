//
//  AddViewController.h
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "ToDoItem.h"

@protocol AddViewControllerDelegate;

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addToDoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *addToDoDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *addPriorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *addIsCompletedTextField;
@property (weak, nonatomic) id<AddViewControllerDelegate> delegate;
@end

@protocol AddViewControllerDelegate <NSObject>

- (void)AddViewController:(AddViewController *)viewController didAddNewToDoItem:(ToDoItem *)toDoItem;

@end
