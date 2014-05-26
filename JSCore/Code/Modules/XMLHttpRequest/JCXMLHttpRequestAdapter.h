//
//  JCXMLHttpRequestAdapter.h
//  JSCore
//
//  Created by Sergey Zenchenko on 5/25/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import <Foundation/Foundation.h>


//Read: http://xmlhttprequest.ru

@protocol JCXMLHttpRequest <JSExport>

@property (nonatomic, strong) JSValue *onreadystatechange;
@property (nonatomic, assign) NSInteger readyState;
@property (nonatomic, strong) id response;
@property (nonatomic, strong) NSString *responseText;
@property (nonatomic, assign) NSInteger responseType;

@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *statusText;

@property (nonatomic, assign) long timeout;

- (void)open:(NSString*)method :(NSString*)url :(BOOL)async :(NSString*)user :(NSString*)password;

- (void)send;
- (void)send:(NSString*)data;

- (void)abort;

- (NSDictionary*)getAllResponseHeaders;
- (NSString*)getResponseHeader:(NSString*)header;

- (void)setRequestHeader:(NSString*)header :(NSString*)value;

@end

@interface JCXMLHttpRequestAdapter : NSObject <JCXMLHttpRequest>

@end
