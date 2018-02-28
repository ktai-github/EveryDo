//
//  AddViewController.m
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "AddViewController.h"
#import "MasterViewController.h"
#import "ToDoItem.h"

//@protocol AddViewControllerDelegate <NSObject>
//
//- (void)AddViewController:(AddViewController *)viewController didAddNewToDoItem:(ToDoItem *)toDoItem;
//
//@end

//@interface AddViewController ()
//
//@end

@implementation AddViewController

- (IBAction)save:(id)sender {
  ToDoItem *toDoItem = [[ToDoItem alloc] init];
  toDoItem.title = self.addToDoTitleTextField.text;
  toDoItem.toDoDescription = self.addToDoDescriptionTextField.text;
  toDoItem.priorityNumber = [self.addPriorityTextField.text intValue];
  toDoItem.isCompleted = [self.addIsCompletedTextField.text boolValue];
  
  [self.delegate AddViewController:self didAddNewToDoItem:toDoItem];
  [[self navigationController] popViewControllerAnimated:YES];
}
//(UIPanGestureRecognizer *)sender
- (IBAction)cellSwipedRight:(UISwipeGestureRecognizer *)sender {
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
