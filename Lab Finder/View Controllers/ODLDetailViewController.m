//
//  ODLDetailViewController.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDetailViewController.h"
#import "ODLDetailViewModel.h"
#import <UIView+AutoLayout/UIView+AutoLayout.h>

@interface ODLDetailViewController ()
@property (strong, nonatomic, readonly) ODLDetailViewModel *viewModel;
@end

@implementation ODLDetailViewController

- (instancetype)initWithViewModel:(ODLDetailViewModel *)viewModel;
{
    self = [super init];
    if (self)
    {
        _viewModel = viewModel;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
