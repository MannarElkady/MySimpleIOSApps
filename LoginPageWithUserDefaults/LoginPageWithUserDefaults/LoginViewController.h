//
//  LoginViewController.h
//  LoginPageWithUserDefaults
//
//  Created by JETS Mobile Lab - 8 on 3/8/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneLoginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordLoginTextField;
- (IBAction)loginButton:(id)sender;

@property NSUserDefaults *userDefaults;

@end

NS_ASSUME_NONNULL_END
