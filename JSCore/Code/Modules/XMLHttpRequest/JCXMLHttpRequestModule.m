//
//  JCXMLHttpRequestModule.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCXMLHttpRequestModule.h"
#import "JCXMLHttpRequestAdapter.h"

@interface JCXMLHttpRequestModule ()

@end

@implementation JCXMLHttpRequestModule

- (void)attachToContext:(JSContext *)context
{
    context[@"XMLHttpRequest"] = [JCXMLHttpRequestAdapter class];
}

@end
