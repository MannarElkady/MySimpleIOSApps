//
//  UserDetailsViewController.m
//  RegisterAndLoginUsingMap
//
//  Created by Manar Elkady on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "UserDetailsViewController.h"

@interface UserDetailsViewController ()

@end

@implementation UserDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ageLabel.text = self.ageString;
    self.imageURLLabel.text = self.urlImage;
    self.nameLabel.text = self.nameString;
    self.phoneLabel.text = self.phoneString;
    self.latitudeLongitudeLabel.text = [NSString stringWithFormat:@"Longitude: %f ,\nLatitude: %f",self.longitude,self.latitude];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
