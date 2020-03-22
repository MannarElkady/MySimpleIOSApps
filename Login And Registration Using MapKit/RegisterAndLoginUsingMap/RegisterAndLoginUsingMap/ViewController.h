//
//  ViewController.h
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMapViewController.h"
#import "loginViewController.h"
#import "ImagesTableViewController.h"
#import "ViewControllerProtocol.h"

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate, ViewControllerProtocol>
//@property MyMapViewController * myMap;
- (IBAction)imageButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *profileImageURL;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
- (IBAction)registerButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
- (IBAction)locationButton:(id)sender;
@property NSURLConnection * urlConnection;
@property NSURLRequest * urlRequest;
@property NSMutableData* regiserResponseData;

@end

