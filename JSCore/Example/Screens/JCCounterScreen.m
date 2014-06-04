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
@property (nonatomic, assign) NSUInteger value;

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

- (RACCommand*)increment
{
    return [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        self.value++;
        return [RACSignal empty];
    }];
}

@end
