//
//  JCCore.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/22/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCore.h"
@import JavaScriptCore;

@interface JCCore()

@property (nonatomic, strong) NSString *rootFolder;
@property (nonatomic, strong) JSContext *jsContext;

@end

@implementation JCCore

- (instancetype)initWithRootFolder:(NSString *)rootFolder mainFile:(NSString *)mainFile
{
    NSParameterAssert(rootFolder.length > 0);
    NSParameterAssert(mainFile.length > 0);

    self = [super init];
    if (self) {
        self.jsContext = [JSContext new];
        
        __weak typeof(self) weekSelf = self;
        
        self.jsContext[@"require"] = ^(NSString *filePath) {
            return [weekSelf requireFile:filePath];
        };
        
        self.jsContext[@"log"] = ^(id obj) {
            NSLog(@"Log:%@", obj);
        };
        
        self.rootFolder = rootFolder;
        [self requireFile:mainFile];
        
        JSValue *function = self.jsContext[@"bla"];
        
        [function callWithArguments:@[^{
            NSLog(@"qqq");
        }]];
    }
    return self;
}

- (id)requireFile:(NSString *)filePath
{
    NSParameterAssert(filePath.length > 0);

    if ([[filePath pathExtension] isEqualToString:@""]) {
        filePath = [filePath stringByAppendingString:@".js"];
    }

    NSString *fullPath = [self.rootFolder stringByAppendingPathComponent:filePath];
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:fullPath ofType:nil];
    NSLog(@"resource path: %@", resourcePath);

    if (!resourcePath) {
        return nil;
    }
    
    NSString *fileContent = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:resourcePath]
                                                     encoding:NSUTF8StringEncoding
                                                        error:nil];
    
    NSString *jsModule = [NSString stringWithFormat:@"var exports = {};\n%@;\n exports;", fileContent];
    
    return [self.jsContext evaluateScript:jsModule];
}

@end
