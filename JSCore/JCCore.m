//
//  JCCore.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/22/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCore.h"
#import "JCConsoleModule.h"
#import "JCRequireModule.h"
#import "JCExceptionHandlerModule.h"
#import "JCFSModule.h"
#import "JCTimeoutModule.h"
#import "JCLocalStorageModule.h"
#import "JCXMLHttpRequestModule.h"

@interface JCCore() <JCRequireModuleDelegate>

@property (nonatomic, strong) NSBundle *bundle;
@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) NSMutableArray *modules;

@end

@implementation JCCore

- (instancetype)initWithBundle:(NSBundle *)bundle
{
    NSParameterAssert(bundle != nil);

    self = [super init];
    if (self) {
        self.bundle = bundle;
        self.modules = [NSMutableArray new];
        self.jsContext = [JSContext new];
        self.jsContext[@"__modules"] = @{};
        
        [self addModule:[JCExceptionHandlerModule new]];
        [self addModule:[JCConsoleModule new]];
        [self addModule:[JCTimeoutModule new]];
        [self addModule:[JCLocalStorageModule new]];
        [self addModule:[JCXMLHttpRequestModule new]];
        
        [self addModule:[[JCFSModule alloc] initWithBundle:bundle]];
        [self addModule:[[JCRequireModule alloc] initWithBundle:bundle delegate:self]];
    }
    return self;
}

- (void)addModule:(id<JCModule>)module
{
    [module attachToContext:self.jsContext];
    [self.modules addObject:module];
}

- (JSValue*)resolveModule:(NSString*)moduleName
{
    return self.jsContext[@"__modules"][moduleName];
}

@end
