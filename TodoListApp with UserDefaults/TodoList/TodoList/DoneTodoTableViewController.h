//
//  DoneTodoTableViewController.h
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoEntity.h"
#import "DetailsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneTodoTableViewController : UITableViewController <UISearchBarDelegate>
@property NSMutableArray* todosArray;
@property NSData *todoData;
@property NSUserDefaults* userDefaultsObject;
@property TodoEntity* selectedTodo;
@end

NS_ASSUME_NONNULL_END
