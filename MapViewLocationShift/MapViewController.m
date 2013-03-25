//
//  MapViewController.m
//  MapViewLocationShift
//
//  Created by sai on 13-3-22.
//  Copyright (c) 2013年 xmsai. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MapViewAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:@"我的位置" andCoordinate:self.location.coordinate];
	[self.mapView addAnnotation:newAnnotation];
    self.mapView.showsUserLocation = YES;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.location.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:TRUE];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.location = nil;
    self.mapView = nil;
}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1500, 1500);
	[mv setRegion:region animated:YES];
	[mv selectAnnotation:mp animated:YES];
}

@end
