//
//  JCRequireModule.h
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCModule.h"

@protocol JCRequireModuleDelegate <NSObject>

- (JSValue*)resolveModule:(NSString*)moduleName;

@end

@interface JCRequireModule : NSObject <JCModule>

- (instancetype)initWithBundle:(NSBundle*)bundle delegate:(id<JCRequireModuleDelegate>)delegate;

@end
