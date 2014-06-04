//
//  JCSignalBridge.h
//  JSCore
//
//  Created by SS on 6/4/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCSignalBridge : NSObject

+ (RACSignal*)racFromJS:(JSValue *)jsSignal;
+ (JSValue*)jsFromRac:(RACSignal *)racSignal withJsSignal:(JSValue *)jsSignal;

@end
