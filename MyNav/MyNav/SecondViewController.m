//
//  SecondViewController.m
//  NavigationBetweenScenes
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showNameLabel.text = self.personeName;
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action: @selector(doneAction)];
    
    [self.navigationItem setRightBarButtonItem:rightButton];
}
-(void) doneAction{
    printf("Done");
    [self.myDelegate clearText];
    [self.navigationController popViewControllerAnimated:YES];
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
