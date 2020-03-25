//
//  DetailsViewController.m
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.userDefaultsObject = [NSUserDefaults standardUserDefaults];
    
    // Do any additional setup after loading the view.
    UIBarButtonItem * rightEditButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action: @selector(editAction)];
       
       [self.navigationItem setRightBarButtonItem:rightEditButton];
    self.todolistdata = [self.userDefaultsObject objectForKey:@"toAddTodoArray"];
    if([self.selectedTodo.todoStatus isEqualToNumber:[NSNumber numberWithInt:1]]){
        [self.inProgressButtonOutlet setEnabled:NO];
    }
    else if([self.selectedTodo.todoStatus isEqualToNumber:[NSNumber numberWithInt:-1] ]){
        [self.inProgressButtonOutlet setEnabled:NO];
        [self.doneButtonOutlet setEnabled:NO];
    }
   
}
-(void) toUpdateDetailsAfterEdit:(TodoEntity*) afterEditTodoEntity{
    self.selectedTodo = afterEditTodoEntity;
}
- (void)viewWillAppear:(BOOL)animated{
    self.todoTitleTextField.text = self.selectedTodo.todoName;
    self.todoDetailsTextField.text = self.selectedTodo.todoDescription;
    self.todoImage.image = [UIImage imageNamed:self.selectedTodo.priorityImageURL];
}

-(void)editAction{
    AddViewController *editViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
    editViewController.detailsControllerReference = self;
    editViewController.selectedToEditTodo = self.selectedTodo;
    [self.navigationController pushViewController:editViewController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)inProgressButton:(id)sender {
    
    if(self.doneButtonOutlet.selected){
         self.doneButtonOutlet.selected = !(self.doneButtonOutlet.selected);
    }
        self.inProgressButtonOutlet.selected = !(self.inProgressButtonOutlet.selected);
        [self updateTodoStatus:[NSNumber numberWithInt:1]];
        [self.navigationController popViewControllerAnimated:YES];
}

-(void) updateTodoStatus:(NSNumber*) status{
    
    self.entity = [TodoEntity new];
    NSInteger myindex;
    self.allTodos = [NSKeyedUnarchiver unarchiveObjectWithData: self.todolistdata];
  //  [self.allTodos removeObjectAtIndex:self.todoIndex];
    for(TodoEntity* ent in self.allTodos){
           if([ent.todoName isEqualToString:self.selectedTodo.todoName] && [ent.todoDescription isEqualToString:self.selectedTodo.todoDescription] && [ent.todoPriority isEqualToNumber:self.selectedTodo.todoPriority]){
               myindex = [self.allTodos indexOfObject:ent];
               NSLog(@"The indx: %ld",(NSUInteger)myindex);
               break;
           }
       }
    [self.allTodos removeObjectAtIndex:(NSUInteger)myindex];
    NSLog(@"\nCount of Array now= %lu",(unsigned long)self.allTodos.count);
    self.entity.todoName = self.selectedTodo.todoName;
    self.entity.priorityImageURL = self.selectedTodo.priorityImageURL;
    self.entity.todoDescription = self.selectedTodo.todoDescription;
    self.entity.todoPriority = self.selectedTodo.todoPriority;
    self.entity.todoDate = self.selectedTodo.todoDate;
    self.selectedTodo.todoStatus = status;
    [self.allTodos addObject:self.selectedTodo];
    NSLog(@"\nCount of Array now= %lu",(unsigned long)self.allTodos.count);
    [self.userDefaultsObject removeObjectForKey:@"toAddTodoArray"];
    [self.userDefaultsObject synchronize];
    self.todolistdata= [NSKeyedArchiver archivedDataWithRootObject:self.allTodos];
    [self.userDefaultsObject setObject:self.todolistdata forKey:@"toAddTodoArray"];
    [self.userDefaultsObject synchronize];
}

- (IBAction)doneButton:(id)sender {
    if(self.inProgressButtonOutlet.selected){
         self.inProgressButtonOutlet.selected = !(self.inProgressButtonOutlet.selected);
    }
     self.doneButtonOutlet.selected = !(self.doneButtonOutlet.selected);
    if(self.doneButtonOutlet.selected){
   
    [self.inProgressButtonOutlet setEnabled:false];
    [self updateTodoStatus:[NSNumber numberWithInt:-1]];
     [self.navigationController popViewControllerAnimated:YES];
    }
}
@end
