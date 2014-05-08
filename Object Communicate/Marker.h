//
//  Marker.h
//  Object Communicate
//
//  Created by William Wu on 5/7/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Item.h"

@interface Marker : MKPointAnnotation

- (void) setItem: (Item *) item;
- (Item *) getItem;

@end
