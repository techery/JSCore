//
//  JCTestViewController.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCTestViewController.h"

@interface JCTestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (nonatomic, strong) JCCounterScreen *screen;
@property (weak, nonatomic) IBOutlet UIButton *incButton;

@end

@implementation JCTestViewController

- (instancetype)initWithScreen:(JCCounterScreen*)screen;
{
    self = [super init];
    if (self) {
        self.screen = screen;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RAC(self.numberLabel, text) = [self.screen.valueSignal map:^id(id value) {
        return [value stringValue];
    }];
    
    self.incButton.rac_command = self.screen.incrementCommand;
    [self.incButton.rac_command.executing subscribeNext:^(id x) {
        if ([x boolValue]) {
            NSLog(@"Executing");
        } else {
            NSLog(@"Not executing");
        }
    }];
}

@end
