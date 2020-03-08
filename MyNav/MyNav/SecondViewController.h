//
//  SecondViewController.h
//  NavigationBetweenScenes
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateFirstViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController
@property NSString* personeName;
@property id <DelegateFirstViewProtocol> myDelegate;

- (IBAction)doneButtonBar:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UILabel *showNameLabel;
@end

NS_ASSUME_NONNULL_END
