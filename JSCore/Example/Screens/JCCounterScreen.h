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

- (instancetype)initWithInternalScreen:(JSValue*)internalScreen;

- (NSUInteger)counterValue;
- (void)increment;

- (void)addObserver:(JCCounterUpdateCallback)callback;
- (void)removeObserver:(JCCounterUpdateCallback)callback;

@end
