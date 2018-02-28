//
//  AddViewController.h
//  EveryDo
//
//  Created by KevinT on 2018-02-27.
//  Copyright © 2018 KevinT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addToDoTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *addToDoDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *addPriorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *addIsCompletedTextField;

@end
