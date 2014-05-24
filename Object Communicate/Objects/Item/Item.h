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

// initializers
- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (double) itemX andY: (double) itemY andActive: (BOOL) state;

// setters
- (void) setName: (NSString *) itemName;
- (void) setDescription: (NSString *) itemDescription;
- (void) setLocationWithX: (double) xPos andY: (double) yPos;
- (void) setActive: (BOOL) state;
- (void) setMarker: (Marker *) pin;
- (void) addImage: (UIImage *) picture;
- (void) setNote: (NSString *) itemNote;

// getters
- (NSString *) getName;
- (NSString *) getDescription;
- (double) getX;
- (double) getY;
- (BOOL) getActive;
- (Marker *) getMarker;
- (NSMutableArray *) getImages;
- (NSString *) getNote;

@end
