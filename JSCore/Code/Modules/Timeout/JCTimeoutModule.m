//
//  JCTimeoutModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCTimeoutModule.h"

@implementation JCTimeoutModule

- (void)attachToContext:(JSContext *)context
{
    context[@"setTimeout"] = ^(JSValue *fn, int timeout){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timeout * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
            [fn callWithArguments:@[]];
        });
    };
}

@end
