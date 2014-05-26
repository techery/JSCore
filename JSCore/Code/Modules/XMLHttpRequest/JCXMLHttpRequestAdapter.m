//
//  JCXMLHttpRequestAdapter.m
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCXMLHttpRequestAdapter.h"

@implementation JCXMLHttpRequestAdapter

@synthesize onreadystatechange = _onreadystatechange;
@synthesize readyState = _readyState;
@synthesize response = _response;
@synthesize responseText = _responseText;
@synthesize responseType = _responseType;
@synthesize status = _status;
@synthesize statusText = _statusText;
@synthesize timeout = _timeout;

- (void)open:(NSString*)method :(NSString*)url :(BOOL)async :(NSString*)user :(NSString*)password
{
    
}

- (void)send
{
    
}

- (void)send:(NSString*)data
{
    
}

- (void)abort
{
    
}

- (NSDictionary*)getAllResponseHeaders
{
    return nil;
}

- (NSString*)getResponseHeader:(NSString*)header
{
    return header;
}

- (void)setRequestHeader:(NSString*)header :(NSString*)value
{
    
}

@end
