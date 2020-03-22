//
//  UserDetailsViewController.h
//  RegisterAndLoginUsingMap
//
//  Created by Manar Elkady on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDetailsViewController : UIViewController
@property NSString * phoneString;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLongitudeLabel;
@property NSString * nameString;
@property NSString * ageString;
@property (weak, nonatomic) IBOutlet UILabel *imageURLLabel;
@property NSString * urlImage;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property float longitude;
@property float latitude;
@end

NS_ASSUME_NONNULL_END
