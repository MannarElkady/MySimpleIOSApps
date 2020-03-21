//
//  ViewControllerWithTableView.h
//  WebServiceProject
//
//  Created by JETS Mobile Lab - 8 on 3/11/20.
//  Copyright © 2020 ITI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerWithTableView : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray * maleFriendArray;
@property NSMutableArray * femaleFriendArray;

@end

NS_ASSUME_NONNULL_END
