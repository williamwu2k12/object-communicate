//
//  AppDelegate.h
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "ListViewController.h"
#import "MapViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RootViewController * RVC;
@property (strong, nonatomic) ListViewController * LVC;
@property (strong, nonatomic) MapViewController * MVC;

@end
