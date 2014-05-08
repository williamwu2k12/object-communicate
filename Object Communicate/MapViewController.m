//
//  MapViewController.m
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"

@interface MapViewController ()

@end

@implementation MapViewController
{
    MKMapView * map;
    CLLocationManager * manager;
    UISegmentedControl * maptype;
    AppDelegate * appDelegate;
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
    appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    [self initMap];
    [self initMaptype];
    [self initManager];
    [self goToX: 37.866913 andY: -122.254971 andZoom: 0.05 withItem: nil andHighlight: NO];

    // load all the previously existing items
    NSMutableArray * itemSource = [[appDelegate LVC] getItemSource];
    for (int i = 0; i < [itemSource count]; i++)
    {
        [self initPin: (Item *) [itemSource objectAtIndex: i]];
    }
    
    // testing
    UIButton * button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [button setFrame: CGRectMake(0.0, 20.0, 80.0, 60.0)];
    [button setTitle: @"TESTING" forState: UIControlStateNormal];
    [button addTarget: self action: @selector(currentLocation) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

- (void) reloadPins
{
    NSMutableArray * itemSource = [[appDelegate LVC] getItemSource];
    for (int i = 0; i < [itemSource count]; i++)
    {
        [self initPin: (Item *) [itemSource objectAtIndex: i]];
    }
}

- (void) initMap
{
    map = [[MKMapView alloc] initWithFrame: CGRectMake(0.0, 0.1 * [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 0.9 * [[UIScreen mainScreen] bounds].size.height)];
    [map setDelegate: (id) self];
    [self.view addSubview: map];
}

- (void) initMaptype
{
    maptype = [[UISegmentedControl alloc] initWithItems: [NSArray arrayWithObjects: @"Standard", @"Satellite", @"Hybrid", @"Terrain", nil]];
    [maptype setFrame: CGRectMake(0.35 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height, 0.6 * [[UIScreen mainScreen] bounds].size.width, 0.05 * [[UIScreen mainScreen] bounds].size.height)];
    [maptype setTitleTextAttributes: [NSDictionary dictionaryWithObject: [UIFont fontWithName: @"Verdana" size: 9.0] forKey: NSFontAttributeName] forState: UIControlStateNormal];
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

- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id<MKAnnotation>) annotation
{
    MKPinAnnotationView * pin = [[MKPinAnnotationView alloc] initWithAnnotation: annotation reuseIdentifier: @"pinview"];
    [pin setEnabled: YES];
    [pin setCanShowCallout: YES];
    if ([[(Marker *) annotation getItem] getActive])
    {
        [pin setPinColor: MKPinAnnotationColorRed];
    }
    else
    {
        [pin setPinColor: MKPinAnnotationColorGreen];
    }
    return pin;
}

- (void) initPin: (Item *) item
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [item getX];
    coordinate.longitude = [item getY];

    Marker * marker = [[Marker alloc] init];
    [marker setCoordinate: coordinate];
    [marker setTitle: [item getName]];
    [marker setSubtitle: [item getDescription]];
    [marker setItem: item];
    [item setMarker: marker];
    [map addAnnotation: marker];
}

- (void) initManager
{
    manager = [[CLLocationManager alloc] init];
    [manager setDelegate: self];
    [manager setDistanceFilter: kCLDistanceFilterNone];
    [manager setDesiredAccuracy: kCLLocationAccuracyBest];
    [manager startUpdatingLocation];
}






- (void) goToX: (double) x andY: (double) y andZoom: (double) zoom withItem: (Item *) item andHighlight: (BOOL) highlight
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = x;
    coordinate.longitude = y;
    MKCoordinateSpan span;
    span.latitudeDelta = zoom;
    span.longitudeDelta = zoom;
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    
    if (highlight)
    {
        [map selectAnnotation: [item getMarker] animated: YES];
    }
    
    [map setRegion: region animated: YES];
    
}

- (void) currentLocation
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [[[map userLocation] location] coordinate].latitude;
    coordinate.longitude = [[[map userLocation] location] coordinate].longitude;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.2;
    span.longitudeDelta = 0.2;
    MKCoordinateRegion region;
    region.center = coordinate;
    region.span = span;
    
    Marker * pin = [[Marker alloc] init];
    [pin setItem: [[Item alloc] initName: @"You are here" andDescription: @"your current location, will change" andX: [[[map userLocation] location] coordinate].latitude andY: [[[map userLocation] location] coordinate].longitude andActive: YES]];
    [pin setCoordinate: coordinate];
    [map addAnnotation: pin];
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
