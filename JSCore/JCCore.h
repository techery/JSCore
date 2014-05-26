//
//  JCCore.h
//  JSCore
//
//  Created by Sergey Zenchenko on 5/22/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCModule.h"

@interface JCCore : NSObject

- (instancetype)initWithBundle:(NSBundle *)bundle;

- (void)addModule:(id<JCModule>)module;

@end
