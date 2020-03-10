//
//  SecondViewController.m
//  SwipeBetweenViews
//
//  Created by JETS Mobile Lab - 8 on 3/9/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "SecondViewController.h"
#import "PresenterTestViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Right Gesture To get back to switch in Tab Bar Controller
    UISwipeGestureRecognizer* mySwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
    mySwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:mySwipeGesture];
    
    //Left Gesture to test presenter view Controller (which pop a view controller above the front view controller)
    UISwipeGestureRecognizer* mySwipeLeftGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftAction)];
    mySwipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:mySwipeLeftGesture];
}

-(void) swipeAction{
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:0];
}

-(void) swipeLeftAction{
    PresenterTestViewController *presenterTestViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"presenterTestViewController"];
   
    //to make the above screen become full screen, not just pop up screen that you can swipe down
     [presenterTestViewController setModalPresentationStyle:UIModalPresentationFullScreen];
    
    //add transition
    [presenterTestViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController: presenterTestViewController animated:YES completion:nil];
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
