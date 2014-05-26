//
//  JCConsoleModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCConsoleModule.h"

@protocol JCConsole <JSExport>

- (void)log:(id)message;

@end

@interface JCConsoleModule () <JCConsole>

@end

@implementation JCConsoleModule

- (void)attachToContext:(JSContext*)context
{
    context[@"console"] = self;
}

- (void)log:(id)message
{
    NSLog(@"JS:%@", message);
}

@end
