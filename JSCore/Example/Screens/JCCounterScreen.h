//
//  JCCounterScreen.h
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^JCCounterUpdateCallback)(NSNumber *value);

@interface JCCounterScreen : NSObject

@property (nonatomic, strong, readonly) RACSignal *valueSignal;
@property (nonatomic, strong, readonly) RACCommand *incrementCommand;

- (instancetype)initWithInternalScreen:(JSValue*)internalScreen;

@end
