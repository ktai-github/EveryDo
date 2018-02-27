//
//  ToDoItem.h
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *toDoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompleted;

@end
