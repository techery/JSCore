//
//  JCCounterScreen.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCounterViewModel.h"
#import "JCSignalBridge.h"
#import "JCCommandBridge.h"

@interface JCCounterViewModel ()


@property (nonatomic, strong) RACSignal *valueSignal;
@property (nonatomic, strong) RACCommand *incrementCommand;

@end

@implementation JCCounterViewModel

- (void)setup
{
    self.valueSignal = [JCSignalBridge racFromJS:self.viewModel[@"valueSignal"]];
    self.incrementCommand = [JCCommandBridge racFromJs:[self.viewModel invokeMethod:@"incrementCommand" withArguments:nil]];
}

@end
