//
//  ToUpdateDetailsAfterEditProtocol.h
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TodoEntity.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ToUpdateDetailsAfterEditProtocol <NSObject>
@required
-(void) toUpdateDetailsAfterEdit:(TodoEntity*) afterEditTodoEntity;
@end

NS_ASSUME_NONNULL_END
