//
//  JCBaseViewModel.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/5/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCBaseViewModel.h"
#import "JCSignalBridge.h"
#import "JCCommandBridge.h"

@interface JCBaseViewModel ()

@property (nonatomic, strong) JSValue *viewModel;

@end

@implementation JCBaseViewModel

- (instancetype)initWithInternalViewModel:(JSValue*)viewModel
{
    NSParameterAssert(viewModel);
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
        [self setup];
    }
    return self;
}

- (void)setup
{
    
}

- (RACSignal*)signalWithName:(NSString*)name
{
    return [JCSignalBridge racFromJS:self.viewModel[name]];
}

- (RACCommand*)commandWithName:(NSString*)name
{
    return [JCCommandBridge racFromJs:self.viewModel[name]];
}

- (RACCommand*)commandFromMethod:(NSString*)methodName
{
    return [JCCommandBridge racFromJs:[self.viewModel invokeMethod:methodName withArguments:nil]];
}


@end
