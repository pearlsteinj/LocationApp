//
//  JLPAppDelegate.m
//  Location
//
//  Created by Josh Pearlstein on 2/16/13.
//  Copyright (c) 2013 Josh Pearlstein. All rights reserved.
//

#import "JLPAppDelegate.h"
#import "JLPViewController.h"
@implementation JLPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    JLPViewController *rootView = (JLPViewController *)self.window.rootViewController;
    [rootView.locationManager stopMonitoringSignificantLocationChanges];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    JLPViewController *rootView = (JLPViewController *)self.window.rootViewController;
    [rootView.locationManager startMonitoringSignificantLocationChanges];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    JLPViewController *rootView = (JLPViewController *)self.window.rootViewController;
    [rootView viewDidLoad];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
