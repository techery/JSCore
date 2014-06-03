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

- (void)viewWillAppear:(BOOL)animated
{
    [self updateLabel];
    
    __weak typeof(self) weakSelf = self;
    
    [self.screen addObserver:^(NSNumber *value) {
        [weakSelf updateLabel];
    }];
}

- (IBAction)increment:(id)sender
{
    [self.screen increment];
}

- (void)updateLabel
{
    self.numberLabel.text = [NSString stringWithFormat:@"%d", self.screen.counterValue];
}

@end
