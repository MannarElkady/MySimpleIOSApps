//
//  ViewController.m
//  SwipeBetweenViews
//
//  Created by JETS Mobile Lab - 8 on 3/9/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer* mySwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
    mySwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:mySwipeGesture];
}

-(void) swipeAction{
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:1];
}


@end
