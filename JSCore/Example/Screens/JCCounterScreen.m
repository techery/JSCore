//
//  JCCounterScreen.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCounterScreen.h"

@interface JCCounterScreen ()

@property (nonatomic, strong) JSValue *internalScreen;

@end

@implementation JCCounterScreen

- (instancetype)initWithInternalScreen:(JSValue*)internalScreen
{
    NSParameterAssert(internalScreen);
    self = [super init];
    if (self) {
        self.internalScreen = internalScreen;
    }
    return self;
}

- (NSUInteger)counterValue
{
    return [[self.internalScreen invokeMethod:@"counterValue" withArguments:nil] toUInt32];
}

- (void)increment
{
    [self.internalScreen invokeMethod:@"increment" withArguments:nil];
}

- (void)addObserver:(JCCounterUpdateCallback)callback
{
    [self.internalScreen invokeMethod:@"addObserver" withArguments:@[callback]];
}

- (void)removeObserver:(JCCounterUpdateCallback)callback
{
    [self.internalScreen invokeMethod:@"removeObserver" withArguments:@[callback]];
}

@end
