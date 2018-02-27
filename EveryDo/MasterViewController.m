//
//  MasterViewController.m
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoItem.h"
#import "TableViewCell.h"

@interface MasterViewController () 

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.navigationItem.leftBarButtonItem = self.editButtonItem;

  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
  self.navigationItem.rightBarButtonItem = addButton;
  
  [self addInitialData];
}


- (void)viewWillAppear:(BOOL)animated {
}

- (void) addInitialData {
  ToDoItem *toDoItem1 = [[ToDoItem alloc] init];
  toDoItem1.title = @"file taxes";
  toDoItem1.toDoDescription = @"with a tax software";
  toDoItem1.priorityNumber = 2;
  toDoItem1.isCompleted = NO;
  [self.objects arrayByAddingObject:toDoItem1];
  
  ToDoItem *toDoItem2 = [[ToDoItem alloc] init];
  toDoItem2.title = @"floor hockey";
  toDoItem2.toDoDescription = @"register for floor hockey";
  toDoItem2.priorityNumber = 3;
  toDoItem2.isCompleted = NO;
  [self.objects arrayByAddingObject:toDoItem2];
  
  ToDoItem *toDoItem3 = [[ToDoItem alloc] init];
  toDoItem3.title = @"contact dev friend";
  toDoItem3.toDoDescription = @"arrange a meeting with him";
  toDoItem3.priorityNumber = 2;
  toDoItem3.isCompleted = YES;
  [self.objects arrayByAddingObject:toDoItem3];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
  if (!self.objects) {
      self.objects = [[NSMutableArray alloc] init];
  }
  [self.objects insertObject:[NSDate date] atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      NSDate *object = self.objects[indexPath.row];
      DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
      [controller setDetailItem:object];
  }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

  NSDate *object = self.objects[indexPath.row];
  cell.textLabel.text = [object description];
  return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  // Return NO if you do not want the specified item to be editable.
  return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.objects removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  }
}


@end
