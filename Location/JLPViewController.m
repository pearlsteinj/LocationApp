//
//  JLPViewController.m
//  Location
//
//  Created by Josh Pearlstein on 2/16/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "JLPViewController.h"

@interface JLPViewController ()

@end

@implementation JLPViewController
@synthesize mapView,locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	locationManager = [[CLLocationManager alloc] init];
    if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Enable Location!"
                                                       message:@"Please Enable Location Services in Settings to continue."
                                                      delegate:self
                                             cancelButtonTitle:@"Cancel"
                                             otherButtonTitles:@"OK!", nil];
        [alert show];

    }
    locationManager.distanceFilter = 1000;;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.delegate = self;
    [locationManager startMonitoringSignificantLocationChanges];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
      
    MKPointAnnotation *pin = [[MKPointAnnotation alloc]init];
    pin.coordinate = newLocation.coordinate;
    pin.title = @"Location";
    [self.mapView addAnnotation:pin];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 1000, 1000);
    [mapView setRegion:region animated:YES];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Enable Location!"
                                                   message:@"Please Enable Location in Settings to continue."
                                                  delegate:self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK!", nil];
    [alert show];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"OK!"]){
        NSLog(@"OK! button Pressed!");
    }
}
@end
