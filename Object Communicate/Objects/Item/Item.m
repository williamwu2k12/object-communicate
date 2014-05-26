//
//  Item.m
//  Object Communicate
//
//  Created by William Wu on 4/19/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "Item.h"

@implementation Item
{
    NSString * name;
    NSString * description;
    NSString * note;
    
    NSMutableArray * images;
    NSMutableArray * accesses;

    double xposition;
    double yposition;
    double battery;
    
    Marker * marker;
    BOOL active;
}



/*******************
**  Initializers  **
*******************/

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (double) itemX andY: (double) itemY andActive: (BOOL) state
{
    self = [super init];
    if (self != nil)
    {
        name = itemName;
        description = itemDescription;
        note = @"";
        images = [[NSMutableArray alloc] init];
        accesses = [[NSMutableArray alloc] init];
        xposition = itemX;
        yposition = itemY;
        battery = 100.0;
        marker = nil;
        active = state;
    }
    return self;
}



/*********************
**  Setter Methods  **
*********************/

- (void) setName: (NSString *) itemName
{
    name = itemName;
}

- (void) setDescription: (NSString *) itemDescription
{
    description = itemDescription;
}

- (void) setNote: (NSString *) itemNote
{
    note = itemNote;
}

- (void) addImage: (UIImage *) picture
{
    [images addObject: picture];
}

- (void) clearImages
{
    [images removeAllObjects];
}

- (void) removeImage: (UIImage *) picture
{
    [images removeObject: picture];
}

- (void) setLocationWithX: (double) itemX andY: (double) itemY
{
    xposition = itemX;
    yposition = itemY;
}

- (void) setBattery: (double) power
{
    battery = power;
}

- (void) setMarker: (Marker *) pin
{
    marker = pin;
}

- (void) setActive: (BOOL) state
{
    active = state;
}



/*********************
**  Getter Methods  **
*********************/

- (NSString *) getName
{
    return name;
}

- (NSString *) getDescription
{
    return description;
}

- (NSString *) getNote
{
    return note;
}

- (NSMutableArray *) getImages
{
    return images;
}

- (NSMutableArray *) getAccesses
{
    return accesses;
}

- (double) getX
{
    return xposition;
}

- (double) getY
{
    return yposition;
}

- (double) getBattery
{
    return battery;
}

- (Marker *) getMarker
{
    return marker;
}

- (BOOL) getActive
{
    return active;
}

@end
