//
//  ViewController.m
//  LoginPageWithUserDefaults
//
//  Created by JETS Mobile Lab - 8 on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUserDefaults:[NSUserDefaults standardUserDefaults]];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //if default cancel button is enabled it will be the 0 index and the remaining is after 0
    if(buttonIndex==0){
        printf("%s",[alertView.message UTF8String]);
    }
}
- (IBAction)registerButton:(id)sender {
    if(self.passwordTextField.text != @"" && self.phoneTextField.text != @""){
        [self.userDefaults setObject:_phoneTextField.text forKey:@"phone"];
        [self.userDefaults setObject:_passwordTextField.text forKey:@"password"];
        LoginViewController* loginViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"loginViewController"];
        [self.navigationController pushViewController:loginViewController animated:YES];
    }
}
@end
