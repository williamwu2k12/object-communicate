//
//  MapViewController.h
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapKit/MapKit.h"
#import "Item.h"
#import "Marker.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate>

- (void) initPin: (Item *) item;
- (void) reloadPins;
- (void) goToX: (double) x andY: (double) y andZoom: (double) zoom withItem: (Item *) item andHighlight: (BOOL) highlight;

@end
