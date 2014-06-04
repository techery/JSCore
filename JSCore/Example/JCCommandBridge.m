//
//  JCCommandBridge.m
//  JSCore
//
//  Created by SS on 6/4/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCommandBridge.h"
#import "JCSignalBridge.h"

@implementation JCCommandBridge

+ (RACCommand *)racFromJs:(JSValue *)jsCommand
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        JSValue *jsSignal = [jsCommand invokeMethod:@"execute" withArguments:@[input]];

        return [JCSignalBridge racFromJS:jsSignal];
    }];
}

@end
