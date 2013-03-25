//
//  ViewController.m
//  MapViewLocationShift
//
//  Created by sai on 13-3-22.
//  Copyright (c) 2013年 xmsai. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[LocationManager shared] startGetLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showUserLocation:(id)sender {
    void (^complete) (void) = ^(){
        MapViewController *mapViewController = [[MapViewController alloc]initWithNibName:@"MapViewController" bundle:nil];
        mapViewController.location = [[LocationManager shared]userLocation];
        [self.navigationController pushViewController:mapViewController animated:YES];
    };
    if (![[LocationManager shared]isLocationTimeout]) {
        complete();
    }
    [[LocationManager shared]refreshLocation:complete failureBlock:nil];
    
}

- (IBAction)refreshLocation:(id)sender {
    void (^complete) (void) = ^(){
        NSLog(@"get location success");
    };
    void (^failure) (void) = ^(){
        NSLog(@"get location failure");
    };
    [[LocationManager  shared]refreshLocation:complete failureBlock:failure];
    
}
@end
