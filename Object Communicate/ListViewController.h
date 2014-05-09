//
//  ListViewController.h
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate>

- (void) initCell: (Item *) item;
- (NSMutableArray *) getItemSource;

@end
