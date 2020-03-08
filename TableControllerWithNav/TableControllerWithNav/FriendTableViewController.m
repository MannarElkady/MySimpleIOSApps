//
//  FriendTableViewController.m
//  FriendsTableViewController
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "FriendTableViewController.h"
#import "DetailsViewController.h"

@interface FriendTableViewController ()

@end

@implementation FriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maleFriendArray = [NSMutableArray new];
    self.femaleFriendArray = [NSMutableArray new];
    Friend * manar = [Friend new];
    manar.age=@"123";
    manar.name=@"manar";
    manar.email=@"manara@gmail.com";
    Friend * ahmed = [Friend new];
    manar.age=@"456";
    manar.name=@"ahmed";
    manar.email=@"ahmed@gmail.com";
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows;
    switch(section){
        case 0:
            numberOfRows = [self.femaleFriendArray count];
            break;
        case 1:
            numberOfRows = [self.maleFriendArray count];
            break;
    }
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch(indexPath.section){
        case 0:
            cell.textLabel.text = [(Friend *)[self.femaleFriendArray objectAtIndex:indexPath.row] name];
            break;
        case 1:
            cell.textLabel.text = [(Friend *)[self.maleFriendArray objectAtIndex:indexPath.row] name];
            break;
    }
    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString* secTitle;
    switch(section){
        case 0:
            secTitle = @"Females";
            break;
        case 1:
            secTitle = @"Males";
            break;
            
    }
    return secTitle;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Friend * selectedFriend;
    DetailsViewController *detailsView= [self.storyboard instantiateViewControllerWithIdentifier:@"detailsViewController"];
    switch (indexPath.section) {
        case 0:
            selectedFriend = (Friend *)[self.femaleFriendArray objectAtIndex:indexPath.row];
            detailsView.friendDetails=selectedFriend;
            break;
        case 1:
            selectedFriend = (Friend *)[self.maleFriendArray objectAtIndex:indexPath.row];
            detailsView.friendDetails=selectedFriend;
            break;
    }
    [self.navigationController pushViewController:detailsView animated:YES];
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
        switch (indexPath.section) {
            case 0:
                [self.femaleFriendArray removeObjectAtIndex:indexPath.row];
                break;
                
            case 1:
                [self.maleFriendArray removeObjectAtIndex:indexPath.row];
                break;
        }
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
