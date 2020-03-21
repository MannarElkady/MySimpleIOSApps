//
//  MyMapViewController.m
//  RegisterAndLoginUsingMap
//
//  Created by MagoSpark on 3/20/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

#import "MyMapViewController.h"

@interface MyMapViewController ()

@end

@implementation MyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //if to add touch gesture not long press
    /*UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleGesture:)];
    tgr.numberOfTapsRequired = 2;
    tgr.numberOfTouchesRequired = 1;
    [mapView addGestureRecognizer:tgr];
    [tgr release];*/
    
    //if to add touch gesture by long press
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleTouchMapGesture:)];
    lpgr.minimumPressDuration = 2.0;  //user must press for 2sec seconds
    [self.myMapOutlet addGestureRecognizer:lpgr];
    self.myCustomaya= [MyCustomMapAnnotation new];
}

-(void) handleTouchMapGesture:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint mapSelectedCordinates= [gestureRecognizer locationInView:self.myMapOutlet];
    CLLocationCoordinate2D selectedPointLocation= [self.myMapOutlet convertPoint:mapSelectedCordinates toCoordinateFromView:self.myMapOutlet];
   // printf("\nthe x and y are %f %f",mapSelectedCordinates.x,mapSelectedCordinates.y);
    printf("\nthe equivalent long and lat is %f %f",selectedPointLocation.latitude,selectedPointLocation.longitude);
    [self.myCustomaya setCoordinate:selectedPointLocation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)doneButton:(id)sender {
    printf("\n3aaaa %f %f",self.myCustomaya.coordinate.latitude,self.myCustomaya.coordinate.longitude);
    [self.myMapOutlet addAnnotation:self.myCustomaya];
}
- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("Region will be Changed");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    printf("Region Changed");
}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    printf("hey");
}
- (IBAction)returnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:
        nil];
}
@end
