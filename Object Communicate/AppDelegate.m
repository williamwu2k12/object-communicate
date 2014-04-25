//
//  AppDelegate.m
//  Object Communicate
//
//  Created by William Wu on 4/16/14.
//  Copyright (c) 2014 William Wu. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    // initialize view controllers
    self.RVC = [[RootViewController alloc] init];
    
    // figure out how to put this somewhere else
    self.LVC = [[ListViewController alloc] init];
    [[self.LVC tabBarItem] setTitle: @"List"];
    [[self.LVC tabBarItem] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName: @"Verdana" size: 20.0], NSFontAttributeName, nil] forState: UIControlStateNormal];
    [[self.LVC tabBarItem] setTitlePositionAdjustment: UIOffsetMake(0, -12)];

    
    self.MVC = [[MapViewController alloc] init];
    [[self.MVC tabBarItem] setTitle: @"Map"];
    [[self.MVC tabBarItem] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName: @"Verdana" size: 20.0], NSFontAttributeName, nil] forState: UIControlStateNormal];
    [[self.MVC tabBarItem] setTitlePositionAdjustment: UIOffsetMake(0, -12)];
    
    self.IVC = [[ItemViewController alloc] init];
    [[self.IVC tabBarItem] setTitle: @"Item"];
    [[self.IVC tabBarItem] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIFont fontWithName: @"Verdana" size: 20.0], NSFontAttributeName, nil] forState: UIControlStateNormal];
    [[self.IVC tabBarItem] setTitlePositionAdjustment: UIOffsetMake(0, -12)];
    
    
    [self.RVC setViewControllers: [NSArray arrayWithObjects: self.LVC, self.MVC, self.IVC, nil]];
    
    // set default (should be splash, temporarily the list view
//    [self.window setRootViewController: self.LVC];
    [self.window setRootViewController: self.RVC];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
