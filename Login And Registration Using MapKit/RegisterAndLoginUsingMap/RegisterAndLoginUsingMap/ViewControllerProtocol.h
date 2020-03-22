//
//  ViewControllerProtocol.h
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/21/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewControllerProtocol <NSObject>
@required
-(void) sendSelectedImage: (NSString *) imageUrlString;
@end

NS_ASSUME_NONNULL_END
