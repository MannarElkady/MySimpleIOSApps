//
//  ImagesTableViewController.h
//  RegisterAndLoginUsingMap
//
//  Created by Manar Elkady on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "ViewControllerProtocol.h"
#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImagesTableViewController : UITableViewController
@property NSMutableArray * imageUrlsArray;
@property id<ViewControllerProtocol> myViewControllerProtocol;
@property NSMutableArray * imagesArray;
@end

NS_ASSUME_NONNULL_END
