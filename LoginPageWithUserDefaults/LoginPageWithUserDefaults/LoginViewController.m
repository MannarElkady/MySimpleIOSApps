//
//  LoginViewController.m
//  LoginPageWithUserDefaults
//
//  Created by JETS Mobile Lab - 8 on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUserDefaults:[NSUserDefaults standardUserDefaults]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(id)sender {
    NSString * phoneVal = [self.userDefaults objectForKey:@"phone"];
    NSString * passVal = [self.userDefaults objectForKey:@"password"];
    if(phoneVal!=nil && passVal !=nil){
        if([phoneVal isEqualToString:self.phoneLoginTextField.text] && [passVal isEqualToString:self.passwordLoginTextField.text]){
            printf("Correct Login");
            UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"Correct Login" message:@"Correct, Logged in..."delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [uiAlert show];
        }
        else{
            printf("Wrong Login");
            UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"Error Login" message:@"PhoneNumber or Password is Wrong"delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [uiAlert show];
        }
    }
}
@end
