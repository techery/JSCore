//
//  JCCounterScreen.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCounterScreen.h"
#import "JCSignalBridge.h"
#import "JCCommandBridge.h"

@interface JCCounterScreen ()

@property (nonatomic, strong) JSValue *internalScreen;
@property (nonatomic, strong) RACSignal *valueSignal;
@property (nonatomic, strong) RACCommand *incrementCommand;

@end

@implementation JCCounterScreen

- (instancetype)initWithInternalScreen:(JSValue*)internalScreen
{
    NSParameterAssert(internalScreen);
    self = [super init];
    if (self) {
        self.internalScreen = internalScreen;
        self.valueSignal = [JCSignalBridge racFromJS:self.internalScreen[@"valueSignal"]];
        self.incrementCommand = [JCCommandBridge racFromJs:[self.internalScreen invokeMethod:@"increment" withArguments:nil]];
    }
    return self;
}

@end
