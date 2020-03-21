//
//  loginViewController.h
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDetailsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface loginViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property NSURLConnection * urlConnection;
@property NSURLRequest * urlRequest;
@property NSMutableData* loginResponseData;
@property (weak, nonatomic) IBOutlet UITextField *phoneLoginTextField;
- (IBAction)signInButton:(id)sender;

@end

NS_ASSUME_NONNULL_END
