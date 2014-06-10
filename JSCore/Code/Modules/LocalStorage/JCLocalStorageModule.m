//
//  JCLocalStorageModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCLocalStorageModule.h"

@protocol JCLocalStorage <JSExport>

- (void)setItem:(NSString*)key :(NSString*)value;
- (NSString*)getItem:(NSString*)key;
- (void)removeItem:(NSString*)key;

@end

@interface JCLocalStorageModule () <JCLocalStorage>

@end

@implementation JCLocalStorageModule

- (void)attachToContext:(JSContext *)context
{
    context[@"__modules"][@"LocalStorage"] = self;
}

- (void)setItem:(NSString*)key :(NSString*)value;
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
}

- (NSString*)getItem:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
}

- (void)removeItem:(NSString*)key;
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
}

@end
