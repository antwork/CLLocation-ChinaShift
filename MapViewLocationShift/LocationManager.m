//
//  LocationManager.m
//  MapViewLocationShift
//
//  Created by sai on 13-3-22.
//  Copyright (c) 2013年 xmsai. All rights reserved.
//

#import "LocationManager.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager()<MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocation *currentLocation;

@end

@implementation LocationManager

+ (id)shared
{
    static LocationManager *__shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __shared = [[LocationManager alloc]init];
    });
    return  __shared;
}

- (CLLocation *)userLocation
{
    return self.currentLocation;
}

- (void)startGetLocation
{
    self.mapView.showsUserLocation = YES;
}

#pragma mark - getter
- (MKMapView *)mapView
{
    if(!_mapView){
        _mapView = [[MKMapView alloc]init];
        _mapView.delegate = self;
    }
    return _mapView;
}

#pragma mark - map delegate
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.currentLocation = userLocation.location;
    NSLog(@"userlocation: %f,%f",self.currentLocation.coordinate.latitude,self.currentLocation.coordinate.longitude);
    NSLog(@"maplocation: %f,%f",self.mapView.userLocation.coordinate.latitude,self.mapView.userLocation.coordinate.longitude);
    self.mapView.showsUserLocation = NO;
    
}



@end
