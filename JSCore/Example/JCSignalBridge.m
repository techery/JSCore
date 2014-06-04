//
//  JCSignalBridge.m
//  JSCore
//
//  Created by SS on 6/4/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCSignalBridge.h"

@implementation JCSignalBridge

+ (RACSignal*)racFromJS:(JSValue *)jsSignal
{

    BOOL isEmptySignal = [[jsSignal invokeMethod:@"isEmpty" withArguments:nil] toBool];
    if (isEmptySignal) {
        return [RACSignal empty];
    } else {
        return [RACSignal startEagerlyWithScheduler:[RACScheduler scheduler] block:^(id<RACSubscriber> subscriber){
            [jsSignal invokeMethod:@"subscribeNext" withArguments:@[^(id value) {
                [subscriber sendNext:value];
            }]];

            [jsSignal invokeMethod:@"subscribeError" withArguments:@[^(id error) {
                [subscriber sendError:error];
            }]];

            [jsSignal invokeMethod:@"subscribeCompleted" withArguments:@[^() {
                [subscriber sendCompleted];
            }]];
        }];
    }

}


+ (JSValue*)jsFromRac:(RACSignal *)racSignal withJsSignal:(JSValue *)jsSignal
{
    [racSignal subscribeNext:^(id x) {
        [jsSignal invokeMethod:@"sendNext" withArguments:@[x]];
    }];

    [racSignal subscribeError:^(id x) {
        [jsSignal invokeMethod:@"sendError" withArguments:@[x]];
    }];

    [racSignal subscribeCompleted:^{
        [jsSignal invokeMethod:@"sendCompleted" withArguments:nil];
    }];

    return jsSignal;
}

@end
