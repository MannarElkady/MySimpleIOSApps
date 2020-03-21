//
//  ViewController.h
//  SynchAndAsynch
//
//  Created by JETS Mobile Lab - 8 on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UITextView *responseTextView;
@property NSMutableData *myData;
@property (weak, nonatomic) IBOutlet UIWebView *myUIWebView;
- (IBAction)synchButton:(id)sender;
- (IBAction)asynchButton:(id)sender;

@end

