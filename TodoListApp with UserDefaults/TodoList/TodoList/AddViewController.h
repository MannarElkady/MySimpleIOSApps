//
//  AddViewController.h
//  TodoList
//
//  Created by Manar Elkady on 3/20/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoEntity.h"
#import "ToUpdateDetailsAfterEditProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UISlider *prioritySlider;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
- (IBAction)prioritySliderAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *toAddOrEditButtonOutlet;
@property (weak, nonatomic) IBOutlet UITextView *detailsTextField;
- (IBAction)addTodoButton:(id)sender;
@property NSArray *numbersOfSlider;
@property TodoEntity* newtodo;
@property NSMutableArray* toAddTodoArray;
@property NSData *todolistdata;
@property NSUserDefaults* userDefaultsObject;
@property TodoEntity* selectedToEditTodo;
@property id<ToUpdateDetailsAfterEditProtocol> detailsControllerReference;
@end

NS_ASSUME_NONNULL_END
