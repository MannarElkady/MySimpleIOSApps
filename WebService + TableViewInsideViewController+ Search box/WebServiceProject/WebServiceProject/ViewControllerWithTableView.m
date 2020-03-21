//
//  ViewControllerWithTableView.m
//  WebServiceProject
//
//  Created by JETS Mobile Lab - 8 on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewControllerWithTableView.h"


@interface ViewControllerWithTableView ()

@end

@implementation ViewControllerWithTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.maleFriendArray = [NSMutableArray new];
    self.femaleFriendArray = [NSMutableArray new];
    Friend * manar = [Friend new];
    manar.age=@"123";
    manar.name=@"manar";
    manar.email=@"manara@gmail.com";
    Friend * ahmed = [Friend new];
    ahmed.age=@"456";
    ahmed.name=@"ahmed";
    ahmed.email=@"ahmed@gmail.com";
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    [_maleFriendArray addObject:ahmed];
    
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    [_femaleFriendArray addObject:manar];
    UISearchBar* mySearchBar = [[UISearchBar alloc] init];
    self.navigationItem.titleView=mySearchBar;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
            cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
            break;
        case 1:
            cell.textLabel.text = [(Friend *)[self.maleFriendArray objectAtIndex:indexPath.row] name];
            
            cell.imageView.image = [UIImage imageNamed:@"placeholder.png"];
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
    switch (indexPath.section) {
        case 0:
            selectedFriend = (Friend *)[self.femaleFriendArray objectAtIndex:indexPath.row];
            break;
        case 1:
            selectedFriend = (Friend *)[self.maleFriendArray objectAtIndex:indexPath.row];
            break;
    }
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
@end
