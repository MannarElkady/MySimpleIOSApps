//
//  AddViewController.m
//  TodoList
//
//  Created by Manar Elkady on 3/20/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.numbersOfSlider  = @[@(0), @(1), @(2)];
    NSInteger numberOfSteps = ((float)[self.numbersOfSlider count] - 1);
    self.prioritySlider.maximumValue = numberOfSteps;
    self.prioritySlider.minimumValue = 0;
    self.prioritySlider.continuous= YES;
    self.newtodo = [TodoEntity new];
    if(!self.selectedToEditTodo){
        self.newtodo.todoPriority= [NSNumber numberWithInt:0];
        
        self.userDefaultsObject = [NSUserDefaults standardUserDefaults];
        self.todolistdata = [self.userDefaultsObject objectForKey:@"toAddTodoArray"];
        if(self.todolistdata){
            self.toAddTodoArray = [NSKeyedUnarchiver unarchiveObjectWithData: self.todolistdata];
               for (int i=0; i<self.toAddTodoArray.count; i++)
                   {
                       TodoEntity* todohaya = [self.toAddTodoArray objectAtIndex:i];
                      NSLog(@"\n\n Inside Add View Controller:  %@",todohaya.todoName);
                   }
            [self.userDefaultsObject synchronize];
        }
        else{
            //if first time in app create user defaults
            self.toAddTodoArray= [[NSMutableArray alloc]init];
            self.todolistdata= [NSKeyedArchiver archivedDataWithRootObject:self.toAddTodoArray];
            [self.userDefaultsObject setObject:self.todolistdata forKey:@"toAddTodoArray"];
            [self.userDefaultsObject synchronize];
        }
    }
    else{
        //Edit part
        self.userDefaultsObject = [NSUserDefaults standardUserDefaults];
        self.todolistdata = [self.userDefaultsObject objectForKey:@"toAddTodoArray"];
        if(self.todolistdata){
            self.toAddTodoArray = [NSKeyedUnarchiver unarchiveObjectWithData: self.todolistdata];
        }
        [self.userDefaultsObject synchronize];
        self.detailsTextField.text = self.selectedToEditTodo.todoDescription;
        self.titleTextField.text = self.selectedToEditTodo.todoName;
        [self.prioritySlider setValue:[self.selectedToEditTodo.todoPriority floatValue] animated:YES];
        [self.toAddOrEditButtonOutlet setTitle:@"Edit El Todohaya" forState:UIControlStateNormal];
        
    }
    
}

/*
#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addTodoButton:(id)sender {
    if(![self.detailsTextField.text isEqualToString:@""] &&![self.titleTextField.text isEqualToString:@""]){
        if(!self.selectedToEditTodo){
            self.newtodo.todoDescription =self.detailsTextField.text;
            self.newtodo.todoName = self.titleTextField.text;
            
            //for status, 0>> todo , -1>> done, 1>>in progress
            self.newtodo.todoStatus = [NSNumber numberWithInt:0];
            
            NSLocale* currentLocale = [NSLocale currentLocale];
            
            self.newtodo.todoDate = [NSDate date];
            
            NSLog(@"\n\n**** count of array from add button: %lu", (unsigned long)self.toAddTodoArray.count);
            //NSLog(@"%@", [[NSDate date] descriptionWithLocale:currentLocale]);
            if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:0]]){
                printf("\n0");
                self.newtodo.priorityImageURL=@"low";
            }
            else if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:1]]){
                printf("\n1");
                self.newtodo.priorityImageURL=@"med";
            }
            else if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:2]]){
                printf("\n2");
                self.newtodo.priorityImageURL=@"high";
            }
            NSLog(@"\n the title and details%@ %@", self.titleTextField.text,self.detailsTextField.text);
            /*
             NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
             [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
             // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
             NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
             */
            [self.toAddTodoArray  addObject:self.newtodo];
            for(TodoEntity* enti in _toAddTodoArray){
                NSLog(@"\n\nTHe todos array with count %lu is :%@", (unsigned long)self.toAddTodoArray.count,enti.todoName);
            }
            [self.userDefaultsObject removeObjectForKey:@"toAddTodoArray"];
            self.todolistdata= [NSKeyedArchiver archivedDataWithRootObject:self.toAddTodoArray];
            
            [self.userDefaultsObject setObject:self.todolistdata forKey:@"toAddTodoArray"];
            [self.userDefaultsObject synchronize];
        //[self dismissViewControllerAnimated:YES completion:nil];
             [self.navigationController popViewControllerAnimated:YES];
        }
        else{
            UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"Attention Please!" message:@"Are You Sure You want to change your Todo!?"delegate:self cancelButtonTitle:nil otherButtonTitles:@"Yes",@"Cancel", nil];
            [uiAlert show];

        }
       
    }
}
- (IBAction)prioritySliderAction:(id)sender {
     NSUInteger index = (NSUInteger)(self.prioritySlider.value + 0.5);
     [self.prioritySlider setValue:index animated:NO];
    NSLog(@"%@", [NSString stringWithFormat:@"\n\n*****%lu",(unsigned long)index]);
    NSNumber *number = self.numbersOfSlider[index]; // <-- This numeric value you want
    NSLog(@"number: %@", number);
    self.newtodo.todoPriority =number;
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger myindex;
    if(buttonIndex ==0){
         NSLog(@" \nto Remove Object is:%@ and Count now= %lu",self.selectedToEditTodo,(unsigned long)self.toAddTodoArray.count);
        
        for(TodoEntity* ent in self.toAddTodoArray){
            if([ent.todoName isEqualToString:self.selectedToEditTodo.todoName] && [ent.todoDescription isEqualToString:self.selectedToEditTodo.todoDescription] && [ent.todoPriority isEqualToNumber:self.selectedToEditTodo.todoPriority]){
                myindex = [self.toAddTodoArray indexOfObject:ent];
            }
        }
        [self.toAddTodoArray removeObjectAtIndex:myindex];
         NSLog(@"\nCount of Array now= %lu",(unsigned long)self.toAddTodoArray.count);
         self.newtodo.todoName = self.titleTextField.text;
         self.newtodo.todoDescription = self.detailsTextField.text;
         self.newtodo.todoDate = self.selectedToEditTodo.todoDate;
         self.newtodo.todoStatus = self.selectedToEditTodo.todoStatus;
         if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:0]]){
             printf("\n0");
             self.newtodo.priorityImageURL=@"low";
         }
         else if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:1]]){
             printf("\n1");
             self.newtodo.priorityImageURL=@"med";
         }
         else if([self.newtodo.todoPriority isEqualToNumber:[NSNumber numberWithInt:2]]){
             printf("\n2");
             self.newtodo.priorityImageURL=@"high";
         }
         [self.toAddTodoArray addObject:self.newtodo];
         NSLog(@"\nCount of Array now= %lu",(unsigned long)self.toAddTodoArray.count);
         [self.userDefaultsObject removeObjectForKey:@"toAddTodoArray"];
         self.todolistdata= [NSKeyedArchiver archivedDataWithRootObject:self.toAddTodoArray];
         [self.userDefaultsObject setObject:self.todolistdata forKey:@"toAddTodoArray"];
         [self.userDefaultsObject synchronize];
         [self.detailsControllerReference toUpdateDetailsAfterEdit:self.newtodo];
         
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
