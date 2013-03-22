//
//  MapViewController.h
//  MapViewLocationShift
//
//  Created by sai on 13-3-22.
//  Copyright (c) 2013年 xmsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController

@property (strong, nonatomic) CLLocation *location;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
