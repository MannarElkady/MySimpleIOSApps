//
//  TodoEntity.m
//  TodoList
//
//  Created by MagoSpark on 3/23/20.
//  Copyright © 2020 Manar Elkady. All rights reserved.
//

#import "TodoEntity.h"

@implementation TodoEntity
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.todoName forKey:@"todoName"];
    [coder encodeObject:self.priorityImageURL forKey:@"priorityImageURL"];
    [coder encodeObject:self.todoDate forKey:@"todoDate"];
    [coder encodeObject:self.todoDescription forKey:@"todoDescription"];
    [coder encodeObject:self.todoPriority forKey:@"todoPriority"];
    [coder encodeObject:self.todoStatus forKey:@"todoStatus"];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if(self = [super init]){
        self.todoName = [coder decodeObjectForKey:@"todoName"];
        self.priorityImageURL = [coder decodeObjectForKey:@"priorityImageURL"];
        self.todoDate = [coder decodeObjectForKey:@"todoDate"];
        self.todoDescription = [coder decodeObjectForKey:@"todoDescription"];
        self.todoPriority = [coder decodeObjectForKey:@"todoPriority"];
        self.todoStatus = [coder decodeObjectForKey:@"todoStatus"];
    }
    return self;
}
@end
