//
//  MapViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "MapViewController.h"
#import "UIKit/UIKit.h"
#import "MapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    MKMapView * map;
    CLLocationManager * manager;
    UISegmentedControl * maptype;
}

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
    // Do any additional setup after loading the view.
    
    [self initMap];
    [self initManager];
    [self goToPlace]; // replace this with location of item in future
    UIButton * button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [button setFrame: CGRectMake(0.0, 30.0, 50.0, 50.0)];
    [button setTitle: @"TESTING" forState: UIControlStateNormal];
    [button addTarget: self action: @selector(currentLocation) forControlEvents: UIControlEventTouchUpInside];
//    [self.view addSubview: button];
}

- (void) initMap
{
    map = [[MKMapView alloc] initWithFrame: self.view.frame];
    [self.view addSubview: map];
    // initialize hybrid, traffic, etc.
    maptype = [[UISegmentedControl alloc] initWithItems: [NSArray arrayWithObjects: @"Standard", @"Satellite", @"Hybrid", @"Terrain", nil]];
    [maptype setFrame: CGRectMake(0.35 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height, 0.6 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [maptype setTitleTextAttributes: [NSDictionary dictionaryWithObject: [UIFont fontWithName: @"Verdana" size: 9.0] forKey: NSFontAttributeName] forState: UIControlStateNormal];
//    [maptype setBackgroundColor: [UIColor lightGrayColor]];
//    [[maptype layer] setBorderColor: [[UIColor blackColor] CGColor]];
    [maptype setTintColor: [UIColor blackColor]];
    [maptype addTarget: self action: @selector(changeMaptype) forControlEvents: UIControlEventValueChanged];
    [maptype setSelectedSegmentIndex: 0];
    
    [self.view addSubview: maptype];
}

- (void) changeMaptype
{
    switch ([maptype selectedSegmentIndex])
    {
        case 0:
        {
            [map setMapType: MKMapTypeStandard];
            break;
        }
        case 1:
        {
            [map setMapType: MKMapTypeSatellite];
            break;
        }
        case 2:
        {
            [map setMapType: MKMapTypeHybrid];
            break;
        }
        case 3:
        {
            [map setMapType: 3];
            break;
        }
    }
}

- (void) initManager
{
    manager = [[CLLocationManager alloc] init];
    [manager setDelegate: self];
    [manager setDistanceFilter: kCLDistanceFilterNone];
    [manager setDesiredAccuracy: kCLLocationAccuracyBest];
    [manager startUpdatingLocation];
}

- (void) goToPlace
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 37.8633232; // clark kerr coordinates
    coordinate.longitude = -122.24989010000002;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;

    [map setRegion: region animated: YES];
}

- (void) currentLocation
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = manager.location.coordinate.latitude;
    coordinate.longitude = manager.location.coordinate.longitude;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    
    [map setRegion: region animated: YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
