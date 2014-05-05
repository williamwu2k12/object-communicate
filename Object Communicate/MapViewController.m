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

@interface MapViewController ()

@end

@implementation MapViewController
{
    MKMapView * map;
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
    [self initTab];
    
    [self initMap];
    [self goToPlace];
}

- (void) initTab
{

}

- (void) initMap
{
    map = [[MKMapView alloc] initWithFrame: self.view.frame];
    [self.view addSubview: map];
    // initialize hybrid, traffic, etc.
}

- (void) goToPlace
{
    CLLocationCoordinate2D coordinate = {latitude: 61.2180556, longitude: -149.9002778};
    MKCoordinateSpan span = {latitudeDelta: 0.2, longitudeDelta: 0.2};
    MKCoordinateRegion region = {coordinate, span};

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
