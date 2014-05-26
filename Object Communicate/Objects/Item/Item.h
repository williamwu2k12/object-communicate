//
//  Item.h
//  Object Communicate
//
//  Created by William Wu on 4/19/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Marker.h"

@interface Item : NSObject

/*******************
**  Initializers  **
*******************/

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (double) itemX andY: (double) itemY andActive: (BOOL) state;

/*********************
**  Setter Methods  **
*********************/

- (void) setName: (NSString *) itemName;
- (void) setDescription: (NSString *) itemDescription;
- (void) setNote: (NSString *) itemNote;
- (void) addImage: (UIImage *) picture;
- (void) clearImages;
- (void) removeImage: (UIImage *) picture;
- (void) setLocationWithX: (double) xPos andY: (double) yPos;
- (void) setBattery: (double) power;
- (void) setMarker: (Marker *) pin;
- (void) setActive: (BOOL) state;

/*********************
**  Getter Methods  **
*********************/

- (NSString *) getName;
- (NSString *) getDescription;
- (NSString *) getNote;
- (NSMutableArray *) getAccesses;
- (NSMutableArray *) getImages;
- (double) getX;
- (double) getY;
- (double) getBattery;
- (Marker *) getMarker;
- (BOOL) getActive;

@end