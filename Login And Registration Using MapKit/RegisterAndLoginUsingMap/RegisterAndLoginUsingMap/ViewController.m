//
//  ViewController.m
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
MyMapViewController * myMap;
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
- (IBAction)locationButton:(id)sender {
     myMap = [self.storyboard instantiateViewControllerWithIdentifier:@"myMapViewController"];
    [self presentViewController:myMap animated:YES completion:nil];
}
- (IBAction)registerButton:(id)sender {
    if(![self.nameTextField.text isEqualToString:@""] &&![self.phoneTextField.text isEqualToString:@""]
       && ![self.ageTextField.text isEqualToString:@""]){
       
        //shorten url
        NSString *apiEndpoint = [NSString stringWithFormat:@"http://tinyurl.com/api-create.php?url=%@",self.profileImageURL.text];

        
        NSString *shortURL = [NSString stringWithContentsOfURL:[NSURL URLWithString:apiEndpoint] encoding:NSASCIIStringEncoding error:nil];
        NSLog(@"**********\n\n Shorten URL : %@",shortURL);
        //encode URL and Encode the url characters
               NSString *escapedImageURLString = [shortURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
               NSLog(@"\n\n\n******* %@", escapedImageURLString);
        
        NSString * registerURLString = [NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=%@&phone=%@&age=%@&imageURL=%@&longitude=%f&latitude=%f",self.nameTextField.text,self.phoneTextField.text,self.ageTextField.text,escapedImageURLString,myMap.myCustomaya.coordinate.longitude,myMap.myCustomaya.coordinate.latitude];
        NSLog(registerURLString);
        NSURL *registerURL = [NSURL URLWithString:registerURLString];
        self.urlRequest = [[NSURLRequest alloc]initWithURL:registerURL];
        self.urlConnection = [[NSURLConnection alloc]initWithRequest:self.urlRequest delegate:self];
        self.regiserResponseData = [[NSMutableData alloc]init];
        [self.urlConnection start];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    printf("\nFailed to connect from begining");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.regiserResponseData appendData:data];
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]) ;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary* jsonObject = [NSJSONSerialization JSONObjectWithData:self.regiserResponseData options:NSJSONReadingAllowFragments error:nil];
    NSString* statusResult = [jsonObject objectForKey:@"status"];
     if([statusResult isEqualToString: @"FAILING"]){
//           UIAlertView* uiAlert = [[UIAlertView alloc] initWithTitle:@"FAILING" message:@"Failed to Logged in..."delegate:self cancelButtonTitle:nil otherButtonTitles:@"Try Again", nil]
//           [uiAlert show];
         printf("Failed status");
       }
       else if([statusResult isEqualToString: @"SUCCESS"]) {
           printf("Successed status");
           loginViewController* loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginviewcontroller"];
           [self.navigationController pushViewController:loginController animated:YES];
      }
}
- (IBAction)imageButton:(id)sender {
    ImagesTableViewController* imagesController = [self.storyboard instantiateViewControllerWithIdentifier:@"imagesTableViewController"];
    imagesController.myViewControllerProtocol = self;
    [self presentViewController:imagesController animated:YES completion:nil];
}
- (void)sendSelectedImage:(nonnull NSString *)imageUrlString {
    self.profileImageURL.text = imageUrlString;
}

@end
