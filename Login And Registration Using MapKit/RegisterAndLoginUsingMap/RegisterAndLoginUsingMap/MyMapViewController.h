//
//  MyMapViewController.h
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MyCustomMapAnnotation.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
- (IBAction)returnButton:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *myMapOutlet;
@property MyCustomMapAnnotation* myCustomaya ;
- (IBAction)doneButton:(id)sender;
@property CLLocationManager * clLocationManager;
@end

NS_ASSUME_NONNULL_END
