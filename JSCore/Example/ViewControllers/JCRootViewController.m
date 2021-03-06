//
//  JCRootViewController.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCRootViewController.h"
#import "JCTestViewController.h"
#import "JCCore.h"

@interface JCRootViewController ()

@property (nonatomic, strong) JCCore *core;

@end

@implementation JCRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"brain" ofType:@"bundle"];
    self.core = [[JCCore alloc] initWithBundle:[NSBundle bundleWithPath:bundlePath]];
    
    JSValue *counter = [self.core objectWithName:@"counter"];
    
    JCCounterViewModel *screen1 = [[JCCounterViewModel alloc] initWithInternalViewModel:counter];
 
    JCTestViewController *vc1 = [[JCTestViewController alloc] initWithScreen:screen1];
    
    [self addChildViewController:vc1];
    [self.view addSubview:vc1.view];
    
    JCCounterViewModel *screen2 = [[JCCounterViewModel alloc] initWithInternalViewModel:counter];
    JCTestViewController *vc2 = [[JCTestViewController alloc] initWithScreen:screen2];
    
    vc2.view.center = CGPointMake(vc2.view.center.x, vc2.view.center.y + vc2.view.frame.size.height);
    
    [self addChildViewController:vc2];
    [self.view addSubview:vc2.view];
}

@end
