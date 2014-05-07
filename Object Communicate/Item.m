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
}

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (double) itemX andY: (double) itemY
{
    name = itemName;
    description = itemDescription;
    x = itemX;
    y = itemY;
    return self;
}

- (void) setName: (NSString *) itemName
{
    name = itemName;
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

@end
