//
//  MyCustomMapAnnotation.h
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyCustomMapAnnotation : NSObject<MKAnnotation>
@property CLLocationCoordinate2D coordinate;
@end

NS_ASSUME_NONNULL_END
