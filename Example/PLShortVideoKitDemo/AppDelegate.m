//
//  AppDelegate.m
//  PLShortVideoKitDemo
//
//  Created by suntongmian on 17/3/1.
//  Copyright © 2017年 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import <easyar3d/EasyAR3D.h>
#import "easyar3d/EasyARScene.h"
#import "SPARManager.h"

NSString *key = @"zYnUPaCAWtl4WDH3qLu290KRFA7gCCU2iyI9127chA6gvLQyr9CUlawIjMdC1OXxLwsUWvNN2zI2XIElU8AP2QitdZ4WFAfoA8DdJbos2FL4FnPKiSjX52Avh524oxXLF8iOuZXg4YFSQWgKrhkLsJs8K8NxsEdoWh2UCuRsONxjHAdDX0V871RQMydPAyFzx4L0fTUe";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[[Crashlytics class]]];
    
    [EasyAR3D initialize:key];
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    [EasyARScene setUriTranslator:^ NSString * (NSString * uri) {
        SPARManager * manager = [SPARManager sharedManager];
        if ([uri isEqualToString:@"local://Recorder.json"]) {
            return [NSString stringWithFormat:@"%@/Recorder.json",path];
        }else if ([uri isEqualToString:@"local://Recorder.js"]){
            return [NSString stringWithFormat:@"%@/Recorder.js",path];
            
        }else if ([uri isEqualToString:@"local://PostBasic.effect"]){
            
            return [NSString stringWithFormat:@"%@/PostBasic.effect",path];
            
        }
        return [manager getLocalPathForURL:uri];
    }];
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
