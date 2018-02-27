//
//  TableViewCell.h
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell 

//@property (nonatomic) NSString *title;
//@property (nonatomic) NSString *toDoDescription;
//@property (nonatomic) int priorityNumber;
//@property (nonatomic) BOOL isCompleted;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *toDoDescription;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property (weak, nonatomic) IBOutlet UILabel *isCompleted;

@end
