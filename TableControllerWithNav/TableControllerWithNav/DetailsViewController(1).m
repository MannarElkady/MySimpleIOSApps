//
//  DetailsViewController.m
//  FriendsTableViewController
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.friendNameLabel.text = self.friendDetails.name;
    self.friendEmailLabel.text = self.friendDetails.email;
    self.friendAgeLabel.text = self.friendDetails.age;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
