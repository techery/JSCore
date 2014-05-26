//
//  JCRequireModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCRequireModule.h"

@interface JCRequireModule ()

@property (nonatomic, weak) JSContext *jsContext;
@property (nonatomic, strong) NSBundle *bundle;

@property (nonatomic, weak) id<JCRequireModuleDelegate> delegate;

@end

@implementation JCRequireModule

- (instancetype)initWithBundle:(NSBundle*)bundle delegate:(id<JCRequireModuleDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.bundle = bundle;
        self.delegate = delegate;
    }
    return self;
}

- (void)attachToContext:(JSContext*)context
{
    self.jsContext = context;
    
    __weak typeof(self) weekSelf = self;
    
    self.jsContext[@"nativeRequire"] = ^(NSString *path, NSString *currentFile) {
        return [weekSelf requireFile:path];
    };
    
    self.jsContext[@"_require"] = [self requireFile:@"./require.js"];
    
    [self requireFile:@"/index.js"];
}

- (id)requireFile:(NSString *)filePath
{
    NSParameterAssert(filePath.length > 0);
    
    NSString *resourcePath = [[self.bundle bundlePath] stringByAppendingPathComponent:filePath];
    
    NSString *fileContent = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:resourcePath]
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    if (!fileContent) {
        id module = [self.delegate resolveModule:filePath];
        if (!module) {
            NSLog(@"File not found %@", filePath);
        }
        return module;
    }
    
    NSString *jsModule = nil;
    
    if ([filePath.pathExtension isEqualToString:@"json"]) {
        jsModule = [NSString stringWithFormat:@"(function(){return %@;})()", fileContent];
    } else {
        jsModule = [NSString stringWithFormat:@"\
                    (function(){\
                    var exports = {};\
                    var module = {'exports' : exports};\
                    var __filename = '%@';\
                    var require = function(file) {return _require(file, __filename);};\
                    %@;\
                    return module.exports;\
                    })();\
                    ", filePath, fileContent];
    }
    
    return [self.jsContext evaluateScript:jsModule];
}


@end
