//
//  JCFSModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCFSModule.h"

@protocol JCFS <JSExport>

- (BOOL)existsSync:(NSString*)path;

@end

@interface JCFSModule () <JCFS>

@property (nonatomic, strong) NSBundle *bundle;

@end

@implementation JCFSModule

- (instancetype)initWithBundle:(NSBundle*)bundle;
{
    self = [super init];
    if (self) {
        self.bundle = bundle;
    }
    return self;
}

- (void)attachToContext:(JSContext *)context
{
    context[@"__modules"][@"fs"] = self;
}

- (BOOL)existsSync:(NSString*)path
{
    NSString *fullPath = [[self.bundle bundlePath] stringByAppendingPathComponent:path];
    return [[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:nil];
}

@end
