//
//  TodoTableViewController.h
//  TodoListApp
//
//  Created by mactest on 3/18/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//
#import "AddViewController.h"
#import <UIKit/UIKit.h>
#import "TodoEntity.h"
#import "MaterialButtons.h"
#import "DetailsViewController.h"
@interface TodoTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBoxOutlet;
@property (weak, nonatomic) IBOutlet UITableView *mainTableViewOutlet;
@property NSMutableArray* todosArray;
@property MDCFloatingButton *button;
@property NSData *todoData;
@property NSUserDefaults* userDefaultsObject;
@property TodoEntity* selectedTodo;
@end
