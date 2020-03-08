//
//  ViewController.h
//  LoginPageWithUserDefaults
//
//  Created by JETS Mobile Lab - 8 on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property NSUserDefaults *userDefaults;
- (IBAction)registerButton:(id)sender;


@end

