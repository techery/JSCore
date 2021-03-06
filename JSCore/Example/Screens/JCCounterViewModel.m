//
//  JCCounterScreen.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCCounterViewModel.h"


@interface JCCounterViewModel ()

@property (nonatomic, strong) RACSignal *valueSignal;
@property (nonatomic, strong) RACCommand *incrementCommand;

@end

@implementation JCCounterViewModel

- (void)setup
{
    self.valueSignal = [[self signalWithName:@"valueSignal"] map:^id(id value) {
        return [value stringValue];
    }];
    
    self.incrementCommand = [self commandWithName:@"incrementCommand"];
}

@end
