//
//  JCTestViewController.m
//  JSCore
//
//  Created by Sergey Zenchenko on 6/3/14.
//  Copyright (c) 2014 Techery. All rights reserved.
//

#import "JCTestViewController.h"

@interface JCTestViewController ()

@property (nonatomic, strong) JCCounterViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *incButton;

@end

@implementation JCTestViewController

- (instancetype)initWithScreen:(JCCounterViewModel*)viewModel;
{
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RAC(self.numberLabel, text) = self.viewModel.valueSignal;
    RAC(self.incButton, hidden) = self.viewModel.incrementCommand.executing;
    
    self.incButton.rac_command = self.viewModel.incrementCommand;
}

@end
