//
//  AppDelegate.m
//  SHWelcomePageDemo
//
//  Created by apple on 2018/4/20.
//  Copyright © 2018年 ImbaWales. All rights reserved.
//

#import "AppDelegate.h"
#import "SHWelcomePageController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController *homeVC = [[UIViewController alloc] init];
    homeVC.view.backgroundColor = [UIColor redColor];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 通过取SHWelcomeIsLaunchDefaultKey的值来判断是否首次启动app
    if ([defaults boolForKey:SHWelcomeIsLaunchDefaultKey] != YES) {
        // 是第一次启动
        NSArray *imgArr = @[@"welcome1", @"welcome2", @"welcome3"];
        SHWelcomePageController *welcomeVC = [[SHWelcomePageController alloc] initWithImageNameArray:imgArr rootViewController:homeVC];
        // 可自行设置小圆点的位置及属性, "立即体验"按钮的位置及属性
        // welcomeVC.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        // [welcomeVC.showRootControllerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.window.rootViewController = welcomeVC;
    }else{
        // 不是第一次启动
        self.window.rootViewController = homeVC;
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
