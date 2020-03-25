//
//  TodoEntity.h
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoEntity : NSObject <NSCoding>
@property (strong,nonatomic) NSString* todoName;
@property (strong,nonatomic) NSDate* todoDate;
@property (strong,nonatomic) NSString* priorityImageURL;
@property (strong,nonatomic) NSString* todoDescription;
@property (nonatomic) NSNumber* todoPriority;
@property (nonatomic,strong) NSNumber* todoStatus;
@end

NS_ASSUME_NONNULL_END
