//
//  AppDelegate.m
//  SpotlightRevised
//
//  Created by Kunal Shah on 3/8/16.
//  Copyright © 2016 Spotlight. All rights reserved.
//

#import "AppDelegate.h"
// importing the tab bar
#import "YALTabBarItem.h"
#import "YALFoldingTabBarController.h"
#import "YALAnimatingTabBarConstants.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <Parse/Parse.h>



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupYALTabBarController];
    // facebook
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    //parse
    [Parse setApplicationId:@"z3kExaYyrqocyXtzRGWDUfYzGVPPEwcqfqADyKBy" clientKey:@"z3kExaYyrqocyXtzRGWDUfYzGVPPEwcqfqADyKBy"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
}

- (void)setupYALTabBarController {
    YALFoldingTabBarController *tabBarController = (YALFoldingTabBarController *) self.window.rootViewController;
    
    // wassup is rocketship, kunal is settings, video is table view, label is justifyall button.
    
    //prepare leftBarItems
    YALTabBarItem *trending = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"LAUNCH"]
                                                         leftItemImage:nil
                                                        rightItemImage:nil];
    
    
    YALTabBarItem *comments = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"JUSTIFYALL"]
                                                       leftItemImage:nil
                                                      rightItemImage:nil];
    
    tabBarController.leftBarItems = @[trending, comments];
    
    //prepare rightBarItems
    YALTabBarItem *camera = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"VIDEOCAMERA"]
                                                         leftItemImage:nil
                                                        rightItemImage:nil];
    
    
    YALTabBarItem *settings = [[YALTabBarItem alloc] initWithItemImage:[UIImage imageNamed:@"SETTINGS"]
                                                         leftItemImage:nil
                                                        rightItemImage:nil];
    
    tabBarController.rightBarItems = @[camera, settings];
    
    tabBarController.centerButtonImage = [UIImage imageNamed:@"PLUS"];
    
    tabBarController.selectedIndex = 0;
    
    //customize tabBarView
    tabBarController.tabBarView.extraTabBarItemHeight = YALExtraTabBarItemsDefaultHeight;
    tabBarController.tabBarView.offsetForExtraTabBarItems = YALForExtraTabBarItemsDefaultOffset;
    tabBarController.tabBarView.backgroundColor = [UIColor colorWithRed:151.0/255.0 green:216.0/255.0 blue:192.0/255.0 alpha:1];
    tabBarController.tabBarView.tabBarColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1];
    //tabBarController.tabBarView.dotColor = [UIColor colorWithRed:94.0/255.0 green:91.0/255.0 blue:149.0/255.0 alpha:1];
    tabBarController.tabBarViewHeight = YALTabBarViewDefaultHeight;
    tabBarController.tabBarView.tabBarViewEdgeInsets = YALTabBarViewHDefaultEdgeInsets;
    tabBarController.tabBarView.tabBarItemsEdgeInsets = YALTabBarViewItemsDefaultEdgeInsets;
    
    // hide tab bar when camera vc is presented
    if (tabBarController.selectedIndex == 2) {
        tabBarController.tabBarView.backgroundColor = [UIColor blackColor];
        
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
