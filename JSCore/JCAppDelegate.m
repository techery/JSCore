//
//  JCAppDelegate.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/22/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCAppDelegate.h"
#import "JCCore.h"
#import "JCRootViewController.h"

@import JavaScriptCore;

@implementation JCAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    self.window.rootViewController = [JCRootViewController new];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end


