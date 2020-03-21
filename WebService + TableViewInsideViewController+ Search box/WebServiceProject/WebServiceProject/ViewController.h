//
//  ViewController.h
//  WebServiceProject
//
//  Created by JETS Mobile Lab - 8 on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerWithTableView.h"

@interface ViewController : UIViewController <UIAlertViewDelegate,NSURLConnectionDelegate,NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextView;


@property NSMutableData* responseData;

- (IBAction)loginButton:(id)sender;


@property NSURL* url;
@property NSURLRequest *request;
@property NSURLConnection *connection;
@property ViewControllerWithTableView *myTableView;
@end

