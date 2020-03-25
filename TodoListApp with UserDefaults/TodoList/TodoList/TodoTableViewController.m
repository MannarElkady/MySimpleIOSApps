//
//  TodoTableViewController.m
//  TodoListApp
//
//  Created by mactest on 3/18/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "TodoTableViewController.h"

@interface TodoTableViewController ()
{
    NSMutableArray* filtredTodos;
    BOOL isFiltered;
}
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isFiltered = false;
    self.searchBoxOutlet.delegate = self;
    self.todosArray = [[NSMutableArray alloc] init];
    self.userDefaultsObject = [NSUserDefaults standardUserDefaults];
    UIImage *plusImage =
        [[UIImage imageNamed:@"add"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    //initWithFrame:CGRectZero
    self.button = [[MDCFloatingButton alloc] init];
    [self.button setImage:plusImage forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-40.0].active=YES;
    [self.button.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-60.0].active=YES;
 //   [self.button setTitle:@"+" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(addTodoFloatingAction)  forControlEvents:UIControlEventTouchUpInside];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController* detailsOneTodo = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsViewController"];
    detailsOneTodo.selectedTodo = [self.todosArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailsOneTodo animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
  //  printf("Inside view Will Appear");
    self.todosArray = [NSMutableArray new];
    self.todoData =  [self.userDefaultsObject objectForKey:@"toAddTodoArray"];
    NSMutableArray* retrievedArray = [NSKeyedUnarchiver unarchiveObjectWithData:self.todoData];
    for (int i=0; i< retrievedArray.count; i++)
        {
            if([((TodoEntity*)retrievedArray[i]).todoStatus isEqualToNumber:[NSNumber numberWithInt:0]]){
            [self.todosArray addObject:retrievedArray[i]];
        }
            
        }
    [self.mainTableViewOutlet reloadData];
    
}



-(void) addTodoFloatingAction {
    AddViewController * myAddController = [self.storyboard instantiateViewControllerWithIdentifier:@"addViewController"];
    //[self presentViewController:myAddController animated:YES completion:nil];
    [self.navigationController pushViewController:myAddController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* secTitle=@"Avialable Todos";
    return secTitle;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    if(searchText.length == 0){
        isFiltered = false;
    }
    else{
        isFiltered = true;
        filtredTodos = [[NSMutableArray alloc] init];
        
        for (TodoEntity* todo in _todosArray){
            NSRange todoNameRange = [todo.todoName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if(todoNameRange.location != NSNotFound){
                [filtredTodos addObject:todo];
            }
        }
    }
    [self.mainTableViewOutlet reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(isFiltered){
        return filtredTodos.count;
    }
    return self.todosArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    TodoEntity * currentTodo;
    // Configure the cell...
    if(isFiltered){
        currentTodo =((TodoEntity *)[filtredTodos objectAtIndex:indexPath.row]);
    }
    else{
        currentTodo =((TodoEntity *)[self.todosArray objectAtIndex:indexPath.row]);
    }
    cell.textLabel.text = currentTodo.todoName;
    cell.imageView.image = [UIImage imageNamed:currentTodo.priorityImageURL];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.todosArray removeObjectAtIndex:indexPath.row];
        NSLog(@"\n\n\n%d",indexPath.row);
        //update User Defaults Array and Synchronize
        [self.userDefaultsObject removeObjectForKey:@"toAddTodoArray"];
        self.todoData= [NSKeyedArchiver archivedDataWithRootObject:self.todosArray];
        NSLog(@"%lu %lu", (unsigned long)self.todoData.length,(unsigned long)self.todosArray.count);
        [self.userDefaultsObject setObject:self.todoData forKey:@"toAddTodoArray"];
        [self.userDefaultsObject synchronize];
        //Delete from Table View
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation
c
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
