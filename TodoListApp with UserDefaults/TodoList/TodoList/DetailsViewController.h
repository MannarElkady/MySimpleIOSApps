//
//  DetailsViewController.h
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoEntity.h"
#import "AddViewController.h"
#import "ToUpdateDetailsAfterEditProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController <ToUpdateDetailsAfterEditProtocol>
@property (weak, nonatomic) IBOutlet UILabel *todoTitleTextField;
@property (strong, nonatomic) TodoEntity* selectedTodo;
@property (weak, nonatomic) IBOutlet UIButton *doneButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *todoDetailsTextField;
- (IBAction)inProgressButton:(id)sender;
- (IBAction)doneButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *inProgressButtonOutlet;
@property (weak, nonatomic) IBOutlet UIImageView *todoImage;
@property NSUserDefaults* userDefaultsObject;
@property NSDate* todolistdata;
@property NSMutableArray* allTodos;
@property TodoEntity* entity;
@end

NS_ASSUME_NONNULL_END
