//
//  JCFSModule.h
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCModule.h"

@interface JCFSModule : NSObject <JCModule>

- (instancetype)initWithBundle:(NSBundle*)bundle;

@end
