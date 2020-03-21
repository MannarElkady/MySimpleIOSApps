//
//  ViewController.m
//  WebServiceProject
//
//  Created by JETS Mobile Lab - 8 on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}


- (IBAction)loginButton:(id)sender {
    NSString *urlString = [NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=%@&phone=%@",self.nameTextView.text,self.phoneTextView.text];
    
    NSLog(urlString);
    self.url = [NSURL URLWithString:urlString];
    self.request = [NSURLRequest requestWithURL:self.url];
    self.connection = [[NSURLConnection alloc] initWithRequest:self.request delegate:self];
    self.responseData = [[NSMutableData alloc] init];
    [self.connection start];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", [dict objectForKey:@"status"]);
    NSString* statusValue= [dict objectForKey:@"status"];
    if([statusValue isEqualToString: @"FAILING"]){
        UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"FAILING" message:@"Failed to Logged in..."delegate:self cancelButtonTitle:nil otherButtonTitles:@"Try Again", nil];
        [uiAlert show];
    }
    else if([statusValue isEqualToString: @"SUCCESS"]) {
        UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"SUCCESS" message:@"Successed to Logged in..."delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [uiAlert show];
        
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==0){
        if(alertView.title==@"SUCCESS"){
            printf("%s",[alertView.message UTF8String]);
            [self navigateToSecondPage];
        }
    }
}

- (void) navigateToSecondPage{
    self.myTableView = [self.storyboard instantiateViewControllerWithIdentifier:@"tableViewCont"];
    [self.navigationController pushViewController:_myTableView animated:YES];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.responseData appendData:data];
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]) ;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    printf("\nFail");
}
@end
