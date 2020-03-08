//
//  ViewController.m
//  NavigationBetweenScenes
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)sendButton:(id)sender {
    if(_nameTextField.text != @""){
        SecondViewController *secondView= [self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
        secondView.personeName =_nameTextField.text;
        secondView.myDelegate = self;
        [self.navigationController pushViewController:secondView animated:YES];
    }
    
}

-(void) clearText{
    self.nameTextField.text=@"";
}
@end
