//
//  JCAppDelegate.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/22/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCAppDelegate.h"
#import "JCCore.h"

@import JavaScriptCore;

@implementation JCAppDelegate
{
    JCCore *core;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"brain" ofType:@"bundle"];
    core = [[JCCore alloc] initWithBundle:[NSBundle bundleWithPath:bundlePath]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end


