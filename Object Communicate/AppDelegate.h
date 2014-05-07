//
//  AppDelegate.h
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "LoginViewController.h"
#import "ListViewController.h"
#import "MapViewController.h"
#import "ItemViewController.h"
#import "NewItemViewController.h"
#import "Item.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController * RVC;
@property (strong, nonatomic) ListViewController * LVC;
@property (strong, nonatomic) MapViewController * MVC;
@property (strong, nonatomic) ItemViewController * IVC;
@property (strong, nonatomic) NewItemViewController * NIVC;

@end
