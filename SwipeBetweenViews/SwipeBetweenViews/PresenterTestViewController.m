//
//  PresenterTestViewController.m
//  SwipeBetweenViews
//
//  Created by JETS Mobile Lab - 8 on 3/9/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "PresenterTestViewController.h"

@interface PresenterTestViewController ()

@end

@implementation PresenterTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer* mySwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
    mySwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:mySwipeGesture];
}
-(void) swipeAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
