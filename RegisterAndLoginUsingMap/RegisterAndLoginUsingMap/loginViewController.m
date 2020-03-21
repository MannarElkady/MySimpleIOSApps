//
//  loginViewController.m
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController () 

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]
            initWithTarget:self action:@selector(unFocusKeyboard:)];
        tgr.numberOfTouchesRequired = 1;
        [self.view addGestureRecognizer:tgr];
}

-(void) unFocusKeyboard:(UIGestureRecognizer *)gestureRecognizer{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signInButton:(id)sender {
    if(![self.phoneLoginTextField.text isEqualToString:@""]){
        NSString * registerURLString = [NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/findUser?phone=%@",self.phoneLoginTextField.text];
        NSURL *registerURL = [NSURL URLWithString:registerURLString];
        self.urlRequest = [[NSURLRequest alloc]initWithURL:registerURL];
        self.urlConnection = [[NSURLConnection alloc]initWithRequest:self.urlRequest delegate:self];
        self.loginResponseData = [[NSMutableData alloc]init];
        [self.urlConnection start];
    }
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UserDetailsViewController* userDetailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"userDetailsViewController"];
    [self presentViewController:userDetailsController animated:YES completion:nil];
    printf("login fail yahable");
}

-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.loginResponseData appendData:data];
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]) ;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:self.loginResponseData options:NSJSONReadingAllowFragments error:nil];
        NSString* statusResult = [jsonObject objectForKey:@"status"];
         if([statusResult isEqualToString: @"FAILING"]){
             printf("Failed");
           }
           else if([statusResult isEqualToString: @"SUCCESS"]) {
               printf("SuccesseCode");
               NSDictionary* resultJsonObject = [jsonObject objectForKey:@"result"];
               NSLog(@"\n\n*******Dictionary: %@", [resultJsonObject description]);
               UserDetailsViewController* userDetailsController = [self.storyboard instantiateViewControllerWithIdentifier:@"userDetailsViewController"];
               userDetailsController.ageString = [NSString stringWithFormat:@"%d",[resultJsonObject objectForKey:@"age"]];
               userDetailsController.phoneString =[NSString stringWithFormat:@"%d",[resultJsonObject objectForKey:@"phone"]];
               userDetailsController.longitude = [[resultJsonObject objectForKey:@"longitude"] floatValue];
               userDetailsController.latitude = [[resultJsonObject objectForKey:@"latitude"] floatValue];
            
               userDetailsController.nameString= [NSString stringWithString:[NSString stringWithFormat:@"%@",[resultJsonObject objectForKey:@"name"]]];
             
               userDetailsController.urlImage = [NSString stringWithString:[NSString stringWithFormat:@"%@",[resultJsonObject objectForKey:@"imageUrl"]]];
               
               [self presentViewController:userDetailsController animated:YES completion:nil];
          }
}

@end
