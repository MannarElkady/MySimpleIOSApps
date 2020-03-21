//
//  ViewController.m
//  SynchAndAsynch
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
    self.myData = [[NSMutableData alloc] init];
    // Do any additional setup after loading the view.
}


- (IBAction)synchButton:(id)sender {
    NSURL *yahooUrl = [NSURL URLWithString:@"https://maktoob.yahoo.com/?p=us"];
    NSString* responseDataSynch = [[NSString alloc] initWithContentsOfURL:yahooUrl encoding:NSUTF8StringEncoding error:nil];
    self.responseTextView.text=responseDataSynch;
    
    
    [_myUIWebView loadHTMLString:responseDataSynch baseURL:nil];
}



- (IBAction)asynchButton:(id)sender {
    NSURL *yahooUrl = [NSURL URLWithString:@"http://maktoob.yahoo.com/?p=us"];
      NSURLRequest *yahooRequest = [[NSURLRequest alloc] initWithURL:yahooUrl];
      NSURLConnection *yahooConnection = [[NSURLConnection alloc] initWithRequest:yahooRequest delegate:self];
    [yahooConnection start];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    printf("Error, Failed");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.myData appendData:data];
    printf("\nNew Data is added");
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString * responseAsynch = [[NSString alloc] initWithData:self.myData encoding:NSUTF8StringEncoding];
    self.responseTextView.text =responseAsynch;
    
    
    [_myUIWebView loadData:_myData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:nil];
    //if the data was json object (Hash Map (NSDictionary)) we need to do the following
    //NSDictionary  *dict = [NSJSONSerialization JSONObjectWithData:self.myData options:NSJSONReadingAllowFragments error:nil];
    
    //self.responseTextView.text = [dict objectForKey:@"use string if it's string or array here if it's array"];
}

@end
