//
//  Item.h
//  Object Communicate
//
//  Created by William Wu on 4/19/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

- (id) initName: (NSString *) itemName andDescription: (NSString *) itemDescription andX: (CGFloat) itemX andY: (CGFloat) itemY;
- (void) setName: (NSString *) itemName;
- (void) setDescription: (NSString *) itemDescription;
- (void) setLocationWithX: (CGFloat) xPos andY: (CGFloat) yPos;
- (NSString *) getName;
- (NSString *) getDescription;
- (CGFloat) getX;
- (CGFloat) getY;

@end
