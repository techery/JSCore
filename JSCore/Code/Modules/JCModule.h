//
//  JCModule.h
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>

@import JavaScriptCore;

@protocol JCModule <NSObject>

- (void)attachToContext:(JSContext*)context;

@end
