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
    double x;
    double y;
    NSMutableArray * images;
    BOOL active;
    double battery;
    NSMutableArray * accesses;
    Marker * marker;
    NSString * note;
}

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (double) itemX andY: (double) itemY andActive: (BOOL) state
{
    self = [super init];
    if (self != nil)
    {
        name = itemName;
        description = itemDescription;
        x = itemX;
        y = itemY;
        active = state;
        images = [[NSMutableArray alloc] init];
        note = @"";
    }
    return self;
}


// setters

- (void) setName: (NSString *) itemName
{
    name = itemName;
}

- (void) setActive: (BOOL) state
{
    active = state;
}

- (void) setDescription: (NSString *) itemDescription
{
    description = itemDescription;
}

- (void) setLocationWithX: (double) xPos andY: (double) yPos
{
    x = xPos;
    y = yPos;
}

- (void) setMarker: (Marker *) pin
{
    marker = pin;
}

- (void) addImage: (UIImage *) picture
{
    [images addObject: picture];
}

- (void) setNote: (NSString *) itemNote
{
    note = itemNote;
}





// getters

- (NSString *) getName
{
    return name;
}

- (NSString *) getDescription
{
    return description;
}

- (double) getX
{
    return x;
}

- (double) getY
{
    return y;
}

- (BOOL) getActive
{
    return active;
}

- (Marker *) getMarker
{
    return marker;
}

- (NSMutableArray *) getImages
{
    return images;
}

- (NSString *) getNote
{
    return note;
}

@end
