//
//  ViewController.h
//  NavigationBetweenScenes
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateFirstViewProtocol.h"

@interface ViewController : UIViewController <DelegateFirstViewProtocol>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)sendButton:(id)sender;

@end

