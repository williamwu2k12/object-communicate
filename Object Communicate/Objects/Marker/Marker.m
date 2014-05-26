//
//  Marker.m
//  Object Communicate
//
//  Created by William Wu on 5/7/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "Marker.h"

@implementation Marker
{
    Item * item; // circular reference so that the item and marker can reference each other
}

- (id) initMarker
{
    self = [super init];
    if (self != nil)
    {
        
    }
    return self;
}

- (void) setItem: (Item *) object
{
    item = object;
}

- (Item *) getItem
{
    return item;
}

@end
