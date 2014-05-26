//
//  JCExceptionHandlerModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCExceptionHandlerModule.h"

@implementation JCExceptionHandlerModule

- (void)attachToContext:(JSContext*)context
{
    [context setExceptionHandler:^(JSContext *context, JSValue *ex) {
        NSLog(@"Exception:%@", ex);
    }];
}

@end
