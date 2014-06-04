//
//  JCBaseViewModel.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/5/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCBaseViewModel.h"

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

@end
