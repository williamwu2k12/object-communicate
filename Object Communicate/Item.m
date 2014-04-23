//
//  Item.m
//  Object Communicate
//
//  Created by William Wu on 4/19/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "Item.h"

@implementation Item

NSString * name;
NSString * description;
CGFloat x;
CGFloat y;

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (CGFloat) itemX andY: (CGFloat) itemY
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

- (void) setLocationWithX: (CGFloat) xPos andY: (CGFloat) yPos
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

- (CGFloat) getX
{
    return x;
}

- (CGFloat) getY
{
    return y;
}

@end
