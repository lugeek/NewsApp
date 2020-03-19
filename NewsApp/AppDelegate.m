//
//  AppDelegate.m
//  NewsApp
//
//  Created by lugeek on 2019/11/26.
//  Copyright © 2019 lugeek. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "HomeController.h"
#import "VideoController.h"
#import "LikeController.h"
#import "UserController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    HomeController *home = [[HomeController alloc] init];
    
    VideoController *video = [[VideoController alloc] init];
    
    LikeController *like = [[LikeController alloc] init];
    
    UserController *user = [[UserController alloc] init];
    
    [tabBarController setViewControllers:@[home, video, like, user]];
    tabBarController.delegate = self;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:tabBarController];

    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"did select");
}

@end
