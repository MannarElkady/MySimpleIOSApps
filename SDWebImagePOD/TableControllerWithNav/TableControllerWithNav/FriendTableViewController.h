//
//  FriendTableViewController.h
//  FriendsTableViewController
//
//  Created by Manar Elkady on 3/7/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendTableViewController : UITableViewController
@property NSMutableArray * maleFriendArray;
@property NSMutableArray * femaleFriendArray;

@end

NS_ASSUME_NONNULL_END
