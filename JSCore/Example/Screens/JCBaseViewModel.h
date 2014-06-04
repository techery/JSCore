//
//  JCBaseViewModel.h
//  JSCore
//
//  Created by Sergey Zenchenko on 6/5/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCBaseViewModel : NSObject

@property (nonatomic, strong, readonly) JSValue *viewModel;

- (instancetype)initWithInternalViewModel:(JSValue*)viewModel;

- (void)setup;

@end
