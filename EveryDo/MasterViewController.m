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
#import "AddViewController.h"

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate, AddViewControllerDelegate>

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  self.navigationItem.leftBarButtonItem = self.editButtonItem;

  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonTapped:)];
  self.navigationItem.rightBarButtonItem = addButton;
  
  
  [self addInitialData];
  
  UISwipeGestureRecognizer *swipeCellRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeToRightWithGestureRecognizer:)];
  swipeCellRight.direction = UISwipeGestureRecognizerDirectionRight;
  
//  UISwipeGestureRecognizer *swipeLeftWhite = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
//  swipeLeftWhite.direction = UISwipeGestureRecognizerDirectionLeft;
  
  [self.tableView addGestureRecognizer:swipeCellRight];
//  TableViewCell *tableViewCell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:[self.tableView indexPathForSelectedRow]];
//  [tableViewCell addGestureRecognizer:swipeCellRight];

  //self.tableView.delegate = self;
  //self.tableView.dataSource = self;
  
}

- (void) swipeToRightWithGestureRecognizer: (UISwipeGestureRecognizer *) gestureRecognizer {
  
  NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[gestureRecognizer locationInView:self.tableView]];
  TableViewCell *tableViewCell = [self.tableView cellForRowAtIndexPath:indexPath];
  NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:tableViewCell.title.text];
  [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@2
                            range:NSMakeRange(0, [attributeString length])];
  tableViewCell.title.attributedText = attributeString;
}

-(void)addButtonTapped:(id)sender{
  [self performSegueWithIdentifier:@"addSegue" sender:sender];
  
}


- (void)viewWillAppear:(BOOL)animated {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
  return self.objects.count;
  
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

- (void) addInitialData {
  self.objects = [[NSMutableArray alloc] init];
  
  ToDoItem *toDoItem1 = [[ToDoItem alloc] init];
  toDoItem1.title = @"file taxes";
  toDoItem1.toDoDescription = @"with a tax software \nand need to do this by end of april";
  toDoItem1.priorityNumber = 2;
  toDoItem1.isCompleted = NO;
  [self.objects addObject:toDoItem1];
  
  ToDoItem *toDoItem2 = [[ToDoItem alloc] init];
  toDoItem2.title = @"floor hockey";
  toDoItem2.toDoDescription = @"register for floor hockey \nand maybe win a championship";
  toDoItem2.priorityNumber = 3;
  toDoItem2.isCompleted = NO;
  [self.objects addObject:toDoItem2];
  
  ToDoItem *toDoItem3 = [[ToDoItem alloc] init];
  toDoItem3.title = @"contact dev friend";
  toDoItem3.toDoDescription = @"arrange a meeting with him \nand pick his brain about how to make money";
  toDoItem3.priorityNumber = 2;
  toDoItem3.isCompleted = YES;
  [self.objects addObject:toDoItem3];
  
  NSLog(@"%lu", self.objects.count);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)AddViewController:(AddViewController *)viewController didAddNewToDoItem:(ToDoItem *)toDoItem {
  if (!self.objects) {
    self.objects = [[NSMutableArray alloc] init];
  }
  //  [self.objects insertObject:[NSDate date] atIndex:0];
//  [self.objects insertObject:toDoItem atIndex:0];
  [self.objects insertObject:toDoItem atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}
//- (void)insertNewObject:(id)sender {
//  
//  if (!self.objects) {
//      self.objects = [[NSMutableArray alloc] init];
//  }
////  [self.objects insertObject:[NSDate date] atIndex:0];
//  [self.objects insertObject: atIndex:0]
//  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//      NSDate *object = self.objects[indexPath.row];
    ToDoItem *toDoItem = self.objects[indexPath.row];
      DetailViewController *detailVC = (DetailViewController *)[segue destinationViewController];
      [detailVC setDetailItem:toDoItem];
  }
  if ([[segue identifier] isEqualToString:@"addSegue"]) {
    
    AddViewController *addVC = segue.destinationViewController;
    addVC.delegate = self;
//    UINavigationController *nav = segue.destinationViewController;
//    AddItemViewController *addVC = nav.viewControllers[0];
//    addVC.delegate = self;
//    UINavigationController *nav = segue.destinationViewController;
//    AddViewController *addVC = nav.viewControllers[0];
    
  }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  return self.objects.count;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

//  NSDate *object = self.objects[indexPath.row];
//  cell.textLabel.text = [object description];
//  return cell;
  
  TableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
  ToDoItem *toDoItem = [self.objects objectAtIndex:indexPath.row];
  tableViewCell.title.text = toDoItem.title;
  tableViewCell.toDoDescription.text = toDoItem.toDoDescription;
  tableViewCell.priority.text = [NSString stringWithFormat:@"priority %d", toDoItem.priorityNumber];
  
  if (toDoItem.isCompleted == TRUE) {
    tableViewCell.isCompleted.text = @"done";
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:tableViewCell.title.text];
    [attributeString addAttribute:NSStrikethroughStyleAttributeName
                            value:@2
                            range:NSMakeRange(0, [attributeString length])];
    tableViewCell.title.attributedText = attributeString;
  } else {
    tableViewCell.isCompleted.text = @"to do";
  }
//  [NSString stringWithFormat:@"%i", ];
  return tableViewCell;
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
