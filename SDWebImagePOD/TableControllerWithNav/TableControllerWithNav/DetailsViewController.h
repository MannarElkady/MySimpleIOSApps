//
//  DetailsViewController.h
//  FriendsTableViewController
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property Friend* friendDetails;
@property (weak, nonatomic) IBOutlet UILabel *friendEmailLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendAgeLabel;
@end

NS_ASSUME_NONNULL_END
